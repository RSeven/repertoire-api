require "rails_helper"

RSpec.describe SetlistsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/setlists").to route_to("setlists#index")
    end

    it "routes to #show" do
      expect(get: "/setlists/1").to route_to("setlists#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/setlists").to route_to("setlists#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/setlists/1").to route_to("setlists#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/setlists/1").to route_to("setlists#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/setlists/1").to route_to("setlists#destroy", id: "1")
    end
  end
end
