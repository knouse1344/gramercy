class WebsitesController < ApplicationController
  before_action :set_website, only: [:show, :edit, :update, :destroy]

  # GET /websites
  def index
    @websites = Website.all
  end

  # GET /websites/1
  # GET /websites/1.json
  def show
  end

  def colorfont
    @user = current_user
    @site = Website.find(params[:id])
    @color = params[:fontcolor]
    @site.fontcolor = @color
    @site.save
    redirect_to @user, notice: "Thanks!"
  end
  def colorback
    @user = current_user
    @site = Website.find(params[:id])
    @color = params[:backcolor]
    @site.backcolor = @color
    @site.save
    redirect_to @user, notice: "Thanks!"
  end
  def colorfoot
    @user = current_user
    @site = Website.find(params[:id])
    @color = params[:footcolor]
    @site.footcolor = @color
    @site.save
    redirect_to @user, notice: "Thanks!"
  end

  # GET /websites/new
  def new
    @website = Website.new
  end

  # GET /websites/1/edit
  def edit
  end

  # POST /website
  # POST /website.json
  def create
    @website = Website.new(website_params)

    respond_to do |format|
      if @website.save
        format.html { redirect_to '/', notice: 'Website was successfully created.' }
        format.json { render action: 'show', status: :created, location: @website }
      else
        format.html { render action: 'new' }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /website/1
  # PATCH/PUT /website/1.json
  def update
    respond_to do |format|
      if @website.update(website_params)
        format.html { redirect_to @website.user, notice: 'Website was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /website/1
  # DELETE /website/1.json
  def destroy
    @website.destroy
    respond_to do |format|
      format.html { redirect_to websites_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_website
      @website = Website.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def website_params
      params.require(:website).permit(:fontcolor, :footcolor, :backcolor, :heading, :profile, :image, :description, :footer, :user_id)
    end
end
