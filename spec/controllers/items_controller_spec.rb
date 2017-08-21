require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe "items#index" do
    it "should list all the items in the database" do
      item1 = FactoryGirl.create(:item)
      item2 = FactoryGirl.create(:item)
      item1.update_attributes(title: "Something else")
      get :index
      expect(response).to have_http_status :success
      response_value = ActiveSupport::JSON.decode(@response.body)
      expect(response_value.count).to eq(2)
      response_ids = response_value.collect do |item|
        item["id"]
      end
      expect(response_ids).to eq([item1.id, item2.id])
    end
  end

  describe "items#update" do
    it "should allow tasks to be marked as done" do
      item = FactoryGirl.create(:item, done: false)
      put :update, id: item.id, item: { done: true }
      expect(response).to have_http_status(:success)
      item.reload
      expect(item.done).to eq(true)
    end
  end
end
