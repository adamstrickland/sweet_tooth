class L10nController < ApplicationController
  def index
    file = "config/l10n.yml"
    path = Rails.root.join(file)
    ctnt = File.read(path)
    data = YAML.load(ctnt)

    render json: data
  end
end
