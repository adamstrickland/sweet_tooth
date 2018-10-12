module Expansion
  class LocalizationService
    DEFAULT_STRINGS_FILE = "config/localization.yml".freeze
    DEFAULT_STRINGS_PATH = File.expand_path(File.join(File.dirname(__FILE__), "../../..", DEFAULT_STRINGS_FILE)).freeze

    def initialize(strings_file = DEFAULT_STRINGS_PATH)
      @path = strings_file
    end

    def path
      @path.tap do |p|
        puts "using strings from #{p}"
      end
    end

    def content
      File.read(path).tap do
        puts "reading content from #{p}"
      end
    end

    def data
      YAML.load(content).with_indifferent_access.tap do |h|
        puts "found l10n data: #{h.inspect}"
      end
    end

    def [](key)
      dig(key)
    end

    def dig(*keys)
      puts "finding localization string for #{keys.map(&:to_s).join("/")}"
      self.data.dig(*keys).tap do |s|
        puts "localization string: #{keys.map(&:to_s).join("/")} => #{s}"
      end
    end

    class << self
      def call
        self.new.data
      end

      def [](key)
        puts "localizing key #{key}"
        self.new[key]
      end

      def dig(*keys)
        self.new.dig(*keys)
      end
    end
  end
end
