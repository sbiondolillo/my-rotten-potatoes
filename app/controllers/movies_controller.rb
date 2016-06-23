class MoviesController < ApplicationController
  def index
    @movies = Movie.all.sort_by &:title
  end
  
  def show
    begin
      @movie = Movie.find(params[:id])
    rescue
      flash[:notice] = "The movie you requested was not found"
      redirect_to movies_path
    end
  end
  
  def new
  end
  
  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movie_path(@movie)
  end
  
  def edit
    @movie = Movie.find(params[:id])
  end
  
  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end
  
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
  
  private
  
    def movie_params
      params.require(:movie).permit(:title,:rating,:description,:release_date)
    end
  
end