module Importron
  class HashBlock

    def initialize(&block)
      @block = block
      @hash = {}
    end

    def run
      instance_eval &@block
      @hash
    end

    def method_missing(name, *args, &block)
      @hash[name] = args[0]
    end

  end
end
