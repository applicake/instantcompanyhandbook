require 'spec_helper'

describe "handbooks/show.html.haml" do
  before(:each) do
    @handbook = assign(:handbook, stub_model(Handbook,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
