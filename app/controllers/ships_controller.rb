class ShipsController < ApplicationController
  before_filter :fetch_ship, :except => [ :new, :index, :create ]
  # GET /ships
  # GET /ships.xml
  def index
    @ships = Ship.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ships }
    end
  end

  # GET /ships/1
  # GET /ships/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ship }
    end
  end

  # GET /ships/new
  # GET /ships/new.xml
  def new
    @ship = Ship.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ship }
    end
  end

  # GET /ships/1/edit
  def edit
  end

  # POST /ships
  # POST /ships.xml
  def create
    @ship = Ship.new(params[:ship])

    respond_to do |format|
      if @ship.save
        flash[:notice] = 'Ship was successfully created.'
        format.html { redirect_to edit_ship_path(@ship) }
        format.js   { }
        format.xml  { render :xml => @ship, :status => :created, :location => @ship }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ships/1
  # PUT /ships/1.xml
  def update
    respond_to do |format|
      if @ship.update_attributes(params[:ship])
        flash[:notice] = 'Ship was successfully updated.'
        format.html { redirect_to edit_ship_path(@ship) }
        format.js   {  }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ship.errors, :status => :unprocessable_entity }
      end
    end
  end    
  
  def delete
  end

  # DELETE /ships/1
  # DELETE /ships/1.xml
  def destroy
    @ship.destroy

    respond_to do |format|
      format.html { redirect_to(ships_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
    def fetch_ship
      @ship = Ship.find(params[:id])
    end
      
end
