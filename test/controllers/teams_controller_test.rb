require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  describe "GET #index - " do
    before do
      get :index
    end

    let(:team) {Team.create(name: "Montuckskee Coldsnacks", active: true)}

    it "return http success" do
      expect(response).to have_http_status(:success)
    end

  end

end
