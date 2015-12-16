class ChristmascardsController < ApplicationController
  before_action :signed_in_user, only: [:edit, :new, :update, :destroy]
  before_action :set_christmascard, only: [:show, :edit, :update, :destroy]

  # GET /christmascards
  def index
    @christmascards = Christmascard.all
  end

  # GET /christmascards/1
  # GET /christmascards/1.json
  def show
  end

  # GET /christmascards/new
  def new
    @christmascard = Christmascard.new
  end

  # GET /christmascards/1/edit
  def edit
  end

  # POST /christmascard
  # POST /christmascard.json
  def create
    @christmascard = Christmascard.new(christmascard_params)
    @user = User.find(params[:id])
    @christmascard.user_id = @user.id

    respond_to do |format|
      if @christmascard.save
        format.html { redirect_to @christmascard, notice: 'Process item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @christmascard }
      else
        format.html { render action: 'new' }
        format.json { render json: @christmascard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /christmascard/1
  # PATCH/PUT /christmascard/1.json
  def update
    @user = @christmascard.user
    respond_to do |format|
      if @christmascard.update(christmascard_params)
        format.html { redirect_to @user, notice: 'Process item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @christmascard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /christmascard/1
  # DELETE /christmascard/1.json
  def destroy
    @christmascard.destroy
    respond_to do |format|
      format.html { redirect_to '/main/tile' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_christmascard
      @christmascard = Christmascard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def christmascard_params
      params.require(:christmascard).permit(:tree, :lightone, :lighttwo, :lightthree, :flakeone, :flaketwo, :flakethree, :snow, :background, :border, :title, :titlecolor, :user_id)
    end
end
