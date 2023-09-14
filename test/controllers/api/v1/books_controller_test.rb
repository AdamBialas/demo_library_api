require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:one)
    @book = books(:one)
    @book.author_id = @author.id
    @book.save
  end

  test "should get index" do
    get api_v1_author_books_url(@author), as: :json
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post api_v1_author_books_url(@author), params: { book: { title: @book.title, data: @book.data } }, as: :json
    end
    assert_response 201
  end

  test "should show book" do
    get api_v1_author_book_url(@author, @book), as: :json
    assert_response :success
  end

  test "should update book" do
    patch api_v1_author_book_url(@author, @book), params: { book: { title: @book.title, data: @book.data } }, as: :json
    assert_response 200
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete api_v1_author_book_url(@author, @book), as: :json
    end

    assert_response 204
  end
end
