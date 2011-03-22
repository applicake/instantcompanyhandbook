require 'spec_helper'

describe "Handbooks" do
  describe "GET /handbooks" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get handbooks_path
      response.status.should be(200)
    end
  end
end
