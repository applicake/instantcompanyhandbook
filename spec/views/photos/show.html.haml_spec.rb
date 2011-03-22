require 'spec_helper'

describe "photos/show.html.haml" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :order => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
