module Importron
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/run.rake"
    end
  end
end
