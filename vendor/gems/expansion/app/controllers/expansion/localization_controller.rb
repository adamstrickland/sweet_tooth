module Expansion
  class LocalizationController < ApplicationController
    def index
      file = "config/localization.yml"
      path = File.join(File.dirname(__FILE__), "../../../#{file}")
      ctnt = File.read(path)
      data = YAML.load(ctnt)

      render json: data
    end
  end
end
