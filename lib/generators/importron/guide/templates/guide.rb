require "importron"

Importron::Guide.define do

#  Database config. If no db name, :default is used.
#
#  database :db do
#    adapter  "mysql2"
#    database "illustrators_migrate"
#    host     "localhost"
#    user     "root"
#    password nil
#  end
#
#  Import step. :db - database, if not specified, :default is used.
#  i - database record hash.
#  DB - sequel database connection.
#
#  import [:db, :table_name] do |i, DB|
#    Record.create({
#      id:   i[:id]
#      name: i[:name]
#    })
#  end
#

end
