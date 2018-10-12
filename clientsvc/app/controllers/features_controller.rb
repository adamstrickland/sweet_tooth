class FeaturesController < ApplicationController
  def index
    data = if params[:client_id].to_i.odd?
             { features: [:foo, :bar] }
           else
             { features: [:foo] }
           end
    render json: data
  end
end

