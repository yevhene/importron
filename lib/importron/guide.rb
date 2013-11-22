require 'sequel'

module Importron
  class Guide
    def self.define(&block)
      @@guide = Guide.new(&block)
    end

    def self.run(options = {})
      @@guide.run(options)
    end

    def initialize(&block)
      @databases = {}

      @before = []
      @process = []
      @after = []

      instance_eval &block
    end

    def database(name = :default, &block)
      config = HashBlock.new(&block).run
      @databases[name] = Sequel.connect(config)
    end

    def before(options = {}, &block)
      @before << Command.new(options, &block)
    end

    def import(from, options = {}, &block)
      database = :default
      if from.kind_of? Array
        database = from.first
        from = from.last
      end
      @process << Step.new(database, from, options, &block)
    end

    def after(options = {}, &block)
      @after << Command.new(options, &block)
    end

    def run(options = {})
      @before.each do |command|
        command.do @databases, options
      end
      @process.each do |step|
        step.do @databases, options
      end
      @after.each do |command|
        command.do @databases, options
      end
    end
  end
end
