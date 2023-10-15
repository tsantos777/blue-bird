require "test_helper"

class BookDownloadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_download = book_downloads(:one)
  end

  test "should get index" do
    get book_downloads_url
    assert_response :success
  end

  test "should get new" do
    get new_book_download_url
    assert_response :success
  end

  test "should create book_download" do
    assert_difference("BookDownload.count") do
      post book_downloads_url, params: { book_download: {  } }
    end

    assert_redirected_to book_download_url(BookDownload.last)
  end

  test "should show book_download" do
    get book_download_url(@book_download)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_download_url(@book_download)
    assert_response :success
  end

  test "should update book_download" do
    patch book_download_url(@book_download), params: { book_download: {  } }
    assert_redirected_to book_download_url(@book_download)
  end

  test "should destroy book_download" do
    assert_difference("BookDownload.count", -1) do
      delete book_download_url(@book_download)
    end

    assert_redirected_to book_downloads_url
  end
end
