require "spec_helper"

describe PhotosController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/photos" }.should route_to(:controller => "photos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/photos/new" }.should route_to(:controller => "photos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/photos/1" }.should route_to(:controller => "photos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/photos/1/edit" }.should route_to(:controller => "photos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/photos" }.should route_to(:controller => "photos", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/photos/1" }.should route_to(:controller => "photos", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/photos/1" }.should route_to(:controller => "photos", :action => "destroy", :id => "1")
    end

  end
end
