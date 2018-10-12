module ApplicationHelper
  def expansion(key)
    l10n key, locale: locale
  end

  def locale
    case request.domain(2)
    when /\.co\.uk/ then :en_GB
    else
      :en
    end
  end
end
