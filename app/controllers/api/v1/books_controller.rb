module Api
  module V1
    class BooksController < ApplicationController
      include ApplicationHelper
      include Concerns::Authenticable

      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

      before_action :authenticate_user, except: %i[index]
      before_action :set_book, except: %i[create index]
      before_action :set_author
      before_action :validate_json_format, only: %i[create update]
      before_action :validate_author_exist
      before_action :validate_author, except: %i[create index]

      # GET /authors/1/books or /books/
      def index
        if @author
          @pagy, @books = pagy(@author.books)
        else
          @pagy, @books = pagy(Book.all.includes(:author))
        end
        @result = {}
        @result[:books] = @books
        @result[:meta] = pagination(@pagy)
        @result
      end

      # GET /authors/1/books/1 or /books/1
      def show
      end

      # POST /authors/1/books
      def create
        @book = @author.books.new(book_params)
        if @book.save
          render json: @book, status: :created
        else
          render json: { error: @book.errors }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /books/1
      def update
        if @book.update(book_params)
          render json: @book, status: 200
        else
          render json: { error: @book.errors }, status: :unprocessable_entity
        end
      end

      # DELETE /books/1
      def destroy
        @book.destroy
      end

      # POST /authors/1/books/1/cover
      def book_cover_set
        if params[:photo].present?
          if params[:photo].content_type == "image/jpeg"
            @book.cover = params[:photo].read
            if @book.save
              render status: :created
            else
              render json: { error: @book.errors }, status: :unprocessable_entity
            end
          else
            render json: { error: { "photo": "Photo not a jpeg file" } }, status: :unprocessable_entity
          end
        else
          render json: { error: { "photo": "Missing parameter" } }, status: :unprocessable_entity
        end
      end

      # GET /books/1/cover
      def book_cover_get
        if @book.cover.present?
          send_data(@book.cover, :type => "image/jpeg", :filename => "cover_#{@book.id}.jpg", :disposition => "inline")
        else
          render :nothing, status: 404
        end
      end

      # DELETE /authors/1/books/1/cover
      def book_cover_clear
        if @book.cover.present?
          @book.cover = nil
          @book.save
          render json: @book, status: 200
        else
          render :nothing, status: 404
        end
      end

      private

      def set_book
        @book = Book.find(params[:id])
      end

      def set_author
        return @author = Author.where("id": params[:author_id].to_i).first if params[:author_id]

        @author = Author.where("id": @book.author_id).first if @book
      end

      def validate_json_format
        return if params[:data].blank?
        render json: { error: { "data": "Invalid JSON format" } }, status: :unprocessable_entity and return unless book_params[:data].present?
      end

      def validate_author_exist
        return unless params[:author_id]

        render json: { error: { "author_id": "Author not found" } }, status: :not_found and return if (params[:author_id] && @author.nil?)
      end

      def validate_author
        return unless params[:author_id]

        render json: { error: { "author_id": "Wrong author id" } }, status: :unprocessable_entity and return unless (params[:author_id].to_i == @book.author_id)
      end

      def record_not_found
        render json: { error: { "id": "Book not found" } }, status: :not_found
      end

      # Only allow a list of trusted parameters through.
      def book_params
        params.require(:book).permit(:title, data: {})
      end
    end
  end
end
