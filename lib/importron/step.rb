module Importron
  class Step

    def initialize(database, from, options = {}, &block)
      @database = database
      @from = from
      @options = options
      @block = block
    end

    def do(databases, run_options = {})
      puts "Exporting table '#{@from}' from database '#{@database.to_s}'."
      db = databases[@database]

      if run_options[:debug]
        query = "SELECT * FROM #{@from} LIMIT 10"
      else
        query = @from
      end

      db[query].each do |row|
        @block.call row, db
      end
    end
  end
end
