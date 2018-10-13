class DashboardController < ApplicationController
  def index
    client_id = if request.domain(2) =~ /\.co\.uk/
      2
    else
      1
    end

    conn = Faraday.new(url: ENV["CLIENT_SERVICE_ENDPOINT"])
    @client = JSON.parse(conn.get("/clients/#{client_id}").body).with_indifferent_access[:client]
    @features = JSON.parse(conn.get("/clients/#{client_id}/features").body).with_indifferent_access[:features]
  end
end
