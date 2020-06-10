class UserImagesController < ApplicationController
  before_action :set_user_image, only: [:show, :edit, :update, :destroy, :stitchify]

  # GET /user_images
  # GET /user_images.json
  def index
    @title = "Welcome to Stitchify!"
    @user_images = UserImage.all
  end

  # GET /user_images/1
  # GET /user_images/1.json
  def show
    @title = "Stitch"
  end

  # GET /user_images/new
  def new
    @title = "Stitch Something!"
    @user_image = UserImage.new
  end

  # GET /user_images/1/edit
  def edit
    @title = "Edit Your Stitch"
  end

  # POST /user_images
  # POST /user_images.json
  def create
    @title = "Stitch Something!"
    @user_image = UserImage.new(sanitized_user_image_params)

    respond_to do |format|
      if @user_image.save
        format.html { redirect_to @user_image, notice: 'User image was successfully created.' }
        format.json { render :show, status: :created, location: @user_image }
      else
        format.html { render :new }
        format.json { render json: @user_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_images/1
  # PATCH/PUT /user_images/1.json
  def update
    @title = "Edit your Stitch"
    respond_to do |format|
      if @user_image.update(sanitized_user_image_params)
        format.html { redirect_to @user_image, notice: 'User image was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_image }
      else
        format.html { render :edit }
        format.json { render json: @user_image.errors, status: :unprocessable_entity }
      end
    end
  end

  def stitchify
    @user_image.stitchify
    redirect_to @user_image, notice: "Successfully stitchified!"
  end

  # DELETE /user_images/1
  # DELETE /user_images/1.json
  def destroy
    @title = "Destroy Your Stitch"
    @user_image.destroy
    respond_to do |format|
      format.html { redirect_to user_images_url, notice: 'User image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_image
      @user_image = UserImage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_image_params
      params.require(:user_image).permit(
        :acknowledged_privacy,
        :grid_width,
        :name,
        :number_of_colors,
        :px_size,
        :stitch_pic)
    end

    def sanitized_user_image_params
      params = user_image_params
      params[:acknowledged_privacy] = params[:acknowledged_privacy] == '1' ? true : false
      params 
    end
end
