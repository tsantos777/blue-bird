require "application_system_test_case"

class CheckoutsTest < ApplicationSystemTestCase
  setup do
    @checkout = checkouts(:one)
  end

  test "visiting the index" do
    visit checkouts_url
    assert_selector "h1", text: "Checkouts"
  end

  test "should create checkout" do
    visit checkouts_url
    click_on "New checkout"

    fill_in "Alternate availability", with: @checkout.alternate_availability
    fill_in "Alternate date", with: @checkout.alternate_date
    fill_in "Certifications", with: @checkout.certifications
    fill_in "Comments", with: @checkout.comments
    fill_in "Email", with: @checkout.email
    fill_in "First name", with: @checkout.first_name
    fill_in "Interested aircraft", with: @checkout.interested_aircraft
    fill_in "Last name", with: @checkout.last_name
    fill_in "Phone", with: @checkout.phone
    fill_in "Preferred availability", with: @checkout.preferred_availability
    fill_in "Preferred date", with: @checkout.preferred_date
    click_on "Create Checkout"

    assert_text "Checkout was successfully created"
    click_on "Back"
  end

  test "should update Checkout" do
    visit checkout_url(@checkout)
    click_on "Edit this checkout", match: :first

    fill_in "Alternate availability", with: @checkout.alternate_availability
    fill_in "Alternate date", with: @checkout.alternate_date
    fill_in "Certifications", with: @checkout.certifications
    fill_in "Comments", with: @checkout.comments
    fill_in "Email", with: @checkout.email
    fill_in "First name", with: @checkout.first_name
    fill_in "Interested aircraft", with: @checkout.interested_aircraft
    fill_in "Last name", with: @checkout.last_name
    fill_in "Phone", with: @checkout.phone
    fill_in "Preferred availability", with: @checkout.preferred_availability
    fill_in "Preferred date", with: @checkout.preferred_date
    click_on "Update Checkout"

    assert_text "Checkout was successfully updated"
    click_on "Back"
  end

  test "should destroy Checkout" do
    visit checkout_url(@checkout)
    click_on "Destroy this checkout", match: :first

    assert_text "Checkout was successfully destroyed"
  end
end
