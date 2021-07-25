class Admins::GenresController < ApplicationController
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admins_genres_path
    else
      render :new
    end
  end

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admins_genres_path(@genre.id)
    else
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
