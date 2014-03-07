require 'spec_helper'

describe "Lists" do
  describe "GET /lists" do
    it "works! (now write some real specs)" do
      get lists_path
      expect(response.status).to be(200)
    end
  end
end
