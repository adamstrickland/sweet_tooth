require_dependency "expansion/application_controller"
require_relative "../../services/expansion/localization_service"

module Expansion
  class LocalizationController < ApplicationController
    def index
      render json: ::Expansion::LocalizationService.()
    end
  end
end
