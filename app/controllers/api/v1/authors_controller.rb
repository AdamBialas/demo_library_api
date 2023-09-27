module Api
  module V1
    class AuthorsController < ApplicationController
      include ApplicationHelper
      include Concerns::Authenticable

      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

      before_action :authenticate_user, only: %i[create update destroy]
      before_action :set_author, only: %i[show update destroy]

      # GET /authors
      def index
        @pagy, authors = pagy(Author.authors_with_books)
        @result = {}
        @result[:authors] = authors
        @result[:meta] = pagination(@pagy)
        @result
      end

      # GET /authors/1
      def show
      end

      # POST /authors
      def create
        @author = Author.new(author_params)

        if @author.save
          render json: @author, status: :created
        else
          render json: @author.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /authors/1
      def update
        if @author.update(author_params)
          render json: @author
        else
          render json: @author.errors, status: :unprocessable_entity
        end
      end

      # DELETE /authors/1
      def destroy
        @author.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_author
        @author = Author.find(params[:id])
      end

      def record_not_found
        render json: { error: { 'id': "Author not found" } }, status: :not_found
      end

      # Only allow a list of trusted parameters through.
      def author_params
        params.require(:author).permit(:first_name, :last_name, :genre)
      end
    end
  end
end
