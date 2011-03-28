class HandbooksController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:show, :new, :create, :sample]
  

  # GET /handbooks
  # GET /handbooks.xml
  def index
    @handbooks = Handbook.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @handbooks }
    end
  end

  # GET /handbooks/1
  # GET /handbooks/1.xml
  def show
    @handbook = Handbook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @handbook }
    end
  end

  def sample
    @photos = Photo.all.sort_by { |p| p.order }

    respond_to do |format|
      format.html
    end
  end

  # GET /handbooks/new
  # GET /handbooks/new.xml
  def new
    @handbook = Handbook.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @handbook }
    end
  end

  # GET /handbooks/1/edit
  def edit
    @handbook = Handbook.find(params[:id])
  end

  # POST /handbooks
  # POST /handbooks.xml
  def create
    @handbook = Handbook.new(params[:handbook])

    ip_address = request.remote_ip
    @handbook.ip_address = ip_address

    respond_to do |format|
      if @handbook.save
        format.html { redirect_to(@handbook, :notice => 'Your request has been saved.') }
        format.xml  { render :xml => @handbook, :status => :created, :location => @handbook }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @handbook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /handbooks/1
  # PUT /handbooks/1.xml
  def update
    @handbook = Handbook.find(params[:id])

    respond_to do |format|
      if @handbook.update_attributes(params[:handbook])
        format.html { redirect_to(@handbook, :notice => 'Handbook was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @handbook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /handbooks/1
  # DELETE /handbooks/1.xml
  def destroy
    @handbook = Handbook.find(params[:id])
    @handbook.destroy

    respond_to do |format|
      format.html { redirect_to(handbooks_url) }
      format.xml  { head :ok }
    end
  end
end
