class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]

  def index
    @games = Game.order(:title)
  end

  def show
  end

  def new
    @game = Game.new
    @publishers = Publisher.all
    @platforms = Platform.all
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game, notice: "Game was successfully created."
    else
      @publishers = Publisher.all
      @platforms = Platform.all
      render :new
    end
  end

  def edit
    @publishers = Publisher.all
    @platforms = Platform.all
  end

  def update
    if @game.update(game_params)
      redirect_to @game, notice: "Game was successfully updated."
    else
      @publishers = Publisher.all
      @platforms = Platform.all
      render :edit
    end
  end

  def destroy
    @game.destroy
    redirect_to games_url, notice: "Game was successfully destroyed."
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :genre, :releaseDate, :publisher_id, :platform_id)
  end
end
