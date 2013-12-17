module Mksite
  module Command
    class New
      TEMPLATE_DIR = "site_template"

      def self.run(name)
        new(name).run
      end

      attr_reader :name

      def initialize(name)
        @name = name
      end

      def run
        if File.exists?(output_path)
          raise Mksite::Error, "#{output_path} already exists"
        end

        unless File.exists?(output_dir)
          raise Mksite::Error, "#{output_dir} doesn't exist"
        end

        FileUtils.cp_r site_template_path, output_path
      end

    private
      def output_dir
        File.dirname(output_path)
      end

      def output_path
        File.expand_path(name, Dir.pwd)
      end

      def site_template_path
        File.expand_path(File.join("..", "..", "..", TEMPLATE_DIR), __FILE__)
      end
    end
  end
end
