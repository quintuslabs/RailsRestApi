    module Api
       module V1
        class MoviesController < ApplicationController
          skip_before_action :verify_authenticity_token
       

          def index
            movies=Movie.all.order('created_at DESC')
            render json: {status: 'success', message: 'Loaded Movies', data: movies},status: :ok
          end
          def show
              movie = Movie.find(params[:id])
             render json: {status: 'success', message: 'Loaded Movies', data: movie},status: :ok
          end

          def create
            movie = Movie.new(movie_params)
        
            if movie.save
              render json: {status: 'success', message: 'Movie Saved', data: movie},status: :ok
            else
              render json: {status: 'ERROR', message: 'Error Occured !! Please try again', data: movie.errors},status: :unprocessible_entity
            end
          end

          def destroy
            movie = Movie.find(params[:id])
            movie.destroy
            render json: {status: 'success', message: 'Movie Deleted Successfully'},status: :ok
          
          end

          def update
            movie = Movie.find(params[:id])
            if movie.update_attributes(movie_params)
              render json: {status: 'success', message: 'Movie Updated', data: movie},status: :ok
            else
              render json: {status: 'ERROR', message: 'Error Occured !! Please try again', data: movie.errors},status: :unprocessible_entity
            end
          end

          private

          def movie_params
             params.permit(:title, :description, :gener, :year)
          end
          
        end
       end
    end
