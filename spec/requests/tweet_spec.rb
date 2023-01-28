require 'rails_helper'

RSpec.describe "Tweets", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/tweet/create"
      expect(response).to have_http_status(:success)
    end
  end

end
