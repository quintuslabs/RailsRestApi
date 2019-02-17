class MoviesController < ApplicationController
   before_action :find_movie, only: [:show, :edit, :update, :destroy]
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)

    if @movie.save
      redirect_to root_path
    else
      render 'new'
    end

  end

  def show
   
  end
  

   def edit
   end
  def update
    if @movie.update(movie_params)
      redirect_to root_path
     else
      render 'edit'
     end
  end
  def destroy
   if @movie.destroy
    redirect_to root_path
    end

  end

 def find_movie
    @movie = Movie.find(params[:id])
 end

  private
  def movie_params
     params.require(:movie).permit(:title, :description, :gener, :year)
  end

end
