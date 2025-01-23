class PlatformsController < ApplicationController
  before_action :set_platform, only: %i[ show edit update destroy ]

  def index
    @platforms = Platform.order(:name)
  end

  def show
  end

  def new
    @platform = Platform.new
  end

  def edit
  end

  def create
    @platform = Platform.new(platform_params)
    if @platform.save
      redirect_to @platform, notice: "Platform was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @platform.update(platform_params)
      redirect_to @platform, notice: "Platform was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @platform.destroy
      redirect_to platforms_path, status: :see_other, notice: "Platform was successfully destroyed."
    else
      redirect_to platforms_path, alert: "Cannot delete platform because it has associated games."
    end
  end

  private
    def set_platform
      @platform = Platform.find(params[:id])
    end

    def platform_params
      params.require(:platform).permit(:name, :releaseDate, :manufacturer)
    end
end
