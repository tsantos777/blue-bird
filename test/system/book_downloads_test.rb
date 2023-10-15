require "application_system_test_case"

class BookDownloadsTest < ApplicationSystemTestCase
  setup do
    @book_download = book_downloads(:one)
  end

  test "visiting the index" do
    visit book_downloads_url
    assert_selector "h1", text: "Book downloads"
  end

  test "should create book download" do
    visit book_downloads_url
    click_on "New book download"

    click_on "Create Book download"

    assert_text "Book download was successfully created"
    click_on "Back"
  end

  test "should update Book download" do
    visit book_download_url(@book_download)
    click_on "Edit this book download", match: :first

    click_on "Update Book download"

    assert_text "Book download was successfully updated"
    click_on "Back"
  end

  test "should destroy Book download" do
    visit book_download_url(@book_download)
    click_on "Destroy this book download", match: :first

    assert_text "Book download was successfully destroyed"
  end
end
