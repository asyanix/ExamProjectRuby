class PublishersController < ApplicationController
  # Коллбек перед выполнением методов show, edit, update, и destroy для для поиска записи Publisher
  before_action :set_publisher, only: %i[ show edit update destroy ]

  def index
    @publishers = Publisher.order(:name)
  end

  def show
  end

  def new
    @publisher = Publisher.new
  end

  def edit
  end

  def create
    @publisher = Publisher.new(publisher_params)

    if @publisher.save
      redirect_to @publisher, notice: "Publisher was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @publisher.update(publisher_params)
      redirect_to @publisher, notice: "Publisher was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @publisher.destroy
      redirect_to publishers_path, status: :see_other, notice: "Publisher was successfully destroyed."
    else
      redirect_to publishers_path, alert: "Cannot delete publisher because it has associated games."
    end
  end

  private
    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

    def publisher_params
      params.require(:publisher).permit(:name, :country, :general_manager)
    end
end
