require "test_helper"

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:one)
  end

  test "should get index" do
    get api_v1_authors_url, as: :json
    assert_response :success
  end

  test "should create author" do
    assert_difference("Author.count") do
      post api_v1_authors_url, params: { author: { first_name: @author.first_name, last_name: @author.last_name, genre: @author.genre } }, as: :json
    end

    assert_response 201
  end

  test "should show author" do
    get api_v1_author_url(@author), as: :json
    assert_response :success
  end

  test "should update author" do
    patch api_v1_author_url(@author), params: { author: { first_name: @author.first_name, last_name: @author.last_name, genre: @author.genre } }, as: :json
    assert_response 200
  end

  test "should destroy author" do
    assert_difference("Author.count", -1) do
      delete api_v1_author_url(@author), as: :json
    end

    assert_response 204
  end
end
