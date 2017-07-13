require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe "items#index" do
    it "should list all the items in the database" do
      item1 = FactoryGirl.create(:item)
      item2 = FactoryGirl.create(:item)
      get :index
      expect(response).to have_http_status :success
      response_value = ActiveSupport::JSON.decode(@response.body)
      expect(response_value.count).to eq(2)
    end
  end
end
