require "application_system_test_case"

class QuizResultsTest < ApplicationSystemTestCase
  setup do
    @quiz_result = quiz_results(:one)
  end

  test "visiting the index" do
    visit quiz_results_url
    assert_selector "h1", text: "Quiz results"
  end

  test "should create quiz result" do
    visit quiz_results_url
    click_on "New quiz result"

    fill_in "Alternate availability", with: @quiz_result.alternate_availability
    fill_in "Alternate date", with: @quiz_result.alternate_date
    fill_in "Comments", with: @quiz_result.comments
    fill_in "Email", with: @quiz_result.email
    fill_in "First name", with: @quiz_result.first_name
    fill_in "Goals", with: @quiz_result.goals
    check "In us" if @quiz_result.in_us
    fill_in "Last name", with: @quiz_result.last_name
    fill_in "Preferred availability", with: @quiz_result.preferred_availability
    fill_in "Preferred date", with: @quiz_result.preferred_date
    fill_in "Previous training", with: @quiz_result.previous_training
    fill_in "Program", with: @quiz_result.program
    check "Schedule visit" if @quiz_result.schedule_visit
    fill_in "Want cfi", with: @quiz_result.want_cfi
    fill_in "Why pilot", with: @quiz_result.why_pilot
    fill_in "Wings lift", with: @quiz_result.wings_lift
    click_on "Create Quiz result"

    assert_text "Quiz result was successfully created"
    click_on "Back"
  end

  test "should update Quiz result" do
    visit quiz_result_url(@quiz_result)
    click_on "Edit this quiz result", match: :first

    fill_in "Alternate availability", with: @quiz_result.alternate_availability
    fill_in "Alternate date", with: @quiz_result.alternate_date
    fill_in "Comments", with: @quiz_result.comments
    fill_in "Email", with: @quiz_result.email
    fill_in "First name", with: @quiz_result.first_name
    fill_in "Goals", with: @quiz_result.goals
    check "In us" if @quiz_result.in_us
    fill_in "Last name", with: @quiz_result.last_name
    fill_in "Preferred availability", with: @quiz_result.preferred_availability
    fill_in "Preferred date", with: @quiz_result.preferred_date
    fill_in "Previous training", with: @quiz_result.previous_training
    fill_in "Program", with: @quiz_result.program
    check "Schedule visit" if @quiz_result.schedule_visit
    fill_in "Want cfi", with: @quiz_result.want_cfi
    fill_in "Why pilot", with: @quiz_result.why_pilot
    fill_in "Wings lift", with: @quiz_result.wings_lift
    click_on "Update Quiz result"

    assert_text "Quiz result was successfully updated"
    click_on "Back"
  end

  test "should destroy Quiz result" do
    visit quiz_result_url(@quiz_result)
    click_on "Destroy this quiz result", match: :first

    assert_text "Quiz result was successfully destroyed"
  end
end
