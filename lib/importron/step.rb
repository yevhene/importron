module Importron
  class Step

    def initialize(database, from, entity, options = {}, &block)
      @database = database
      @from = from
      @entity = entity
      @options = options
      @block = block
    end

    CHUNK_SIZE = 1000

    def import(data)
      @entity.import data, :validate => false
    end

    def do(databases, run_options = {})
      db = databases[@database]
      count = db["SELECT count(*) FROM #{@from}"].first['count(*)'.to_sym]
      puts "Exporting table '#{@from}' from database '#{@database.to_s}'. (#{count})"

      if run_options[:debug]
        query = "SELECT * FROM #{@from} LIMIT 10"
      else
        query = @from
      end

      data = []
      db[query].each do |row|
        item = @block.call(row, db)
        data << item if item
        if data.length >= CHUNK_SIZE
          import data
          data = []
          print '*'
        end
      end
      import data
      puts '#'
    end
  end
end
