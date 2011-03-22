require 'spec_helper'

describe "handbooks/edit.html.haml" do
  before(:each) do
    @handbook = assign(:handbook, stub_model(Handbook,
      :name => "MyString"
    ))
  end

  it "renders the edit handbook form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => handbooks_path(@handbook), :method => "post" do
      assert_select "input#handbook_name", :name => "handbook[name]"
    end
  end
end
