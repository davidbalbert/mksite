require 'yaml'

module Mksite
  class Site
    CONFIG_FILE = "_config.yml"
    OUTPUT_DIR = "_site"

    attr_reader :path, :config

    def initialize(path)
      @path = path
    end

    def build
      load_config
      copy_to_output
    end

  private
    def load_config
      unless File.exists?(config_path)
        raise Error, "Can't find #{config_path}"
      end

      @config = YAML.load(File.read(config_path))
    end

    def copy_to_output
      FileUtils.mkdir_p(output_path)

      Dir.chdir(path) do
        FileUtils.cp_r Dir["*"] - Dir["_*"], output_path
      end
    end

    def config_path
      File.join(path, CONFIG_FILE)
    end

    def output_path
      File.join(path, OUTPUT_DIR)
    end
  end
end
