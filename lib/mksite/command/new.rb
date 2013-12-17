module Mksite
  module Command
    class New
      def self.run(name)
        new(name).run
      end

      attr_reader :name

      def initialize(name)
        @name = name
      end

      def run
        if File.exists?(output_path)
          raise Mksite::Error, "#{output_path} already exists."
        end

        FileUtils.mkdir_p output_path
      end

    private
      def output_path
        File.expand_path(name, Dir.pwd)
      end
    end
  end
end
