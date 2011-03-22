require 'spec_helper'

describe "handbooks/index.html.haml" do
  before(:each) do
    assign(:handbooks, [
      stub_model(Handbook,
        :name => "Name"
      ),
      stub_model(Handbook,
        :name => "Name"
      )
    ])
  end

  it "renders a list of handbooks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
