require "spec_helper"

describe HandbooksController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/handbooks" }.should route_to(:controller => "handbooks", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/handbooks/new" }.should route_to(:controller => "handbooks", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/handbooks/1" }.should route_to(:controller => "handbooks", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/handbooks/1/edit" }.should route_to(:controller => "handbooks", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/handbooks" }.should route_to(:controller => "handbooks", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/handbooks/1" }.should route_to(:controller => "handbooks", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/handbooks/1" }.should route_to(:controller => "handbooks", :action => "destroy", :id => "1")
    end

  end
end
