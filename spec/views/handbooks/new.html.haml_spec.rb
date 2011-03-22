require 'spec_helper'

describe "handbooks/new.html.haml" do
  before(:each) do
    assign(:handbook, stub_model(Handbook,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new handbook form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => handbooks_path, :method => "post" do
      assert_select "input#handbook_name", :name => "handbook[name]"
    end
  end
end
