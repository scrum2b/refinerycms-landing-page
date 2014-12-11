require 'refinerycms-core'

module Refinery
  autoload :PageModulesGenerator, 'generators/refinery/page_modules_generator'

  module PageModules
    require 'refinery/page_modules/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
