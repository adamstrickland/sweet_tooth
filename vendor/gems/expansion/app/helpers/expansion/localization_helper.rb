require_relative "../../services/expansion/localization_service"

module Expansion
  module LocalizationHelper
    unloadable

    def l10n(key, locale: nil)
      path = [locale, key].compact
      ::Expansion::LocalizationService.dig(*path)
    end
  end
end

