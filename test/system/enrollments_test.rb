require "application_system_test_case"

class EnrollmentsTest < ApplicationSystemTestCase
  setup do
    @enrollment = enrollments(:one)
  end

  test "visiting the index" do
    visit enrollments_url
    assert_selector "h1", text: "Enrollments"
  end

  test "should create enrollment" do
    visit enrollments_url
    click_on "New enrollment"

    fill_in "Alternate availability", with: @enrollment.alternate_availability
    fill_in "Alternate date", with: @enrollment.alternate_date
    fill_in "Comments", with: @enrollment.comments
    fill_in "Email", with: @enrollment.email
    fill_in "First name", with: @enrollment.first_name
    fill_in "Goals", with: @enrollment.goals
    fill_in "Last name", with: @enrollment.last_name
    fill_in "Phone", with: @enrollment.phone
    fill_in "Preferred availability", with: @enrollment.preferred_availability
    fill_in "Preferred date", with: @enrollment.preferred_date
    fill_in "Previous training", with: @enrollment.previous_training
    click_on "Create Enrollment"

    assert_text "Enrollment was successfully created"
    click_on "Back"
  end

  test "should update Enrollment" do
    visit enrollment_url(@enrollment)
    click_on "Edit this enrollment", match: :first

    fill_in "Alternate availability", with: @enrollment.alternate_availability
    fill_in "Alternate date", with: @enrollment.alternate_date
    fill_in "Comments", with: @enrollment.comments
    fill_in "Email", with: @enrollment.email
    fill_in "First name", with: @enrollment.first_name
    fill_in "Goals", with: @enrollment.goals
    fill_in "Last name", with: @enrollment.last_name
    fill_in "Phone", with: @enrollment.phone
    fill_in "Preferred availability", with: @enrollment.preferred_availability
    fill_in "Preferred date", with: @enrollment.preferred_date
    fill_in "Previous training", with: @enrollment.previous_training
    click_on "Update Enrollment"

    assert_text "Enrollment was successfully updated"
    click_on "Back"
  end

  test "should destroy Enrollment" do
    visit enrollment_url(@enrollment)
    click_on "Destroy this enrollment", match: :first

    assert_text "Enrollment was successfully destroyed"
  end
end
