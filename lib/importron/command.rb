module Importron
  class Command
    def initialize(options = {}, &block)
      @options = options
      @block = block
    end

    def do(databases, run_options = {})
      @block.call databases
    end
  end
end
