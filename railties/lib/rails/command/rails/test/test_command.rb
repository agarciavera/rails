require "rails/command"
require "rails/test_unit/minitest_plugin"

module Rails
  module Command
    class TestCommand < Base
      def help # :nodoc:
        perform # Hand over help printing to minitest.
      end

      def perform(*)
        if defined?(ENGINE_ROOT)
          $: << File.expand_path("test", ENGINE_ROOT)
        else
          $: << File.expand_path("../../test", APP_PATH)
        end

        exit Minitest.run(ARGV)
      end
    end
  end
end
