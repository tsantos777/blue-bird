require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  test "should create post" do
    visit posts_url
    click_on "New post"

    fill_in "Author", with: @post.author
    fill_in "Category", with: @post.category
    fill_in "Meta desription", with: @post.meta_desription
    fill_in "Meta keywords", with: @post.meta_keywords
    fill_in "Meta tags", with: @post.meta_tags
    fill_in "Post content", with: @post.post_content
    fill_in "Post date", with: @post.post_date
    fill_in "Title", with: @post.title
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "should update Post" do
    visit post_url(@post)
    click_on "Edit this post", match: :first

    fill_in "Author", with: @post.author
    fill_in "Category", with: @post.category
    fill_in "Meta desription", with: @post.meta_desription
    fill_in "Meta keywords", with: @post.meta_keywords
    fill_in "Meta tags", with: @post.meta_tags
    fill_in "Post content", with: @post.post_content
    fill_in "Post date", with: @post.post_date
    fill_in "Title", with: @post.title
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "should destroy Post" do
    visit post_url(@post)
    click_on "Destroy this post", match: :first

    assert_text "Post was successfully destroyed"
  end
end
