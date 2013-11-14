namespace :importron do
  desc "Run import."
  task :run, [:name, :mode] => :environment do |t, args|
    name = args[:name] || 'guide'
    load "config/importron/#{name}.rb"
    Importron::Guide.run({ debug: args[:mode] == 'debug' })
  end
end
