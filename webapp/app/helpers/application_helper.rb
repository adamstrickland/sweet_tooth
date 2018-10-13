module ApplicationHelper
  def restricted(key, grants)
    if block_given? && grants.map(&:to_sym).include?(key.to_sym)
      yield
    else
      ""
    end
  end

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
