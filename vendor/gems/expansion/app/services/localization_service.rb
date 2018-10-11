module Expansion
  class LocalizationService
    DEFAULT_STRINGS_FILE = "config/localization.yml".freeze
    DEFAULT_STRINGS_PATH = File.expand_path(File.join(File.dirname(__FILE__), "../../..", DEFAULT_STRINGS_FILE)).freeze

    class << self
      def call
        self.new.to_h
      end
    end

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

    alias_method :data, :to_h
  end
end
