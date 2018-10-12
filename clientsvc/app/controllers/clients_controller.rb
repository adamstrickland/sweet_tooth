class ClientsController < ApplicationController
  def show
    data = if params[:id].to_i.odd?
      { client: { name: "Tricia McMillian", region: "US"} }
    else
      { client: { name: "Ford Prefect", region: "UK" } }
    end
    render json: data
  end
end
