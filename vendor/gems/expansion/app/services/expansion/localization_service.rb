module Expansion
  class LocalizationService
    DEFAULT_STRINGS_FILE = "config/localization.yml".freeze
    DEFAULT_STRINGS_PATH = File.expand_path(File.join(File.dirname(__FILE__), "../../..", DEFAULT_STRINGS_FILE)).freeze

    def initialize(strings_file = DEFAULT_STRINGS_PATH)
      @path = strings_file
    end

    attr_accessor :path

    def content
      File.read(path)
    end

    def data
      YAML.load(content)
    end

    class << self
      def call
        self.new.data
      end
    end
  end
end
