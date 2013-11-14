module Importron
  module Generators
    class GuideGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      argument :name, type: :string, default: 'guide'

      def generate_guide
        copy_file "guide.rb", "config/importron/#{name}.rb"
      end
    end
  end
end
