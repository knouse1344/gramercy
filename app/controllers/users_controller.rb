class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :new, :index, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @ccard = @user.christmascards.first
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def christmascard
    @user = User.find(params[:id])
    @newchristmas = Christmascard.new
    @newchristmas.user_id = @user.id
    @newchristmas.tree = "green"
    @newchristmas.lightone = "white"
    @newchristmas.lighttwo = "white"
    @newchristmas.lightthree = "white"
    @newchristmas.flakeone = "white"
    @newchristmas.flaketwo = "white"
    @newchristmas.flakethree = "white"
    @newchristmas.snow = "white"
    @newchristmas.background = "steelblue"
    @newchristmas.border = "grey"
    @newchristmas.title = "Merry Christmas!"
    @newchristmas.titlecolor = "white"
    @newchristmas.save
    redirect_to @user, notice: "Thanks!"
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      flash[:success] = "It's a pleasure to meet you!"
      redirect_to "/main/index"
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { redirect_to @user }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:image, :name, :admin, :username, :password, :password_confirmation)
    end
end
