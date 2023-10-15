require "test_helper"

class EnrollmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enrollment = enrollments(:one)
  end

  test "should get index" do
    get enrollments_url
    assert_response :success
  end

  test "should get new" do
    get new_enrollment_url
    assert_response :success
  end

  test "should create enrollment" do
    assert_difference("Enrollment.count") do
      post enrollments_url, params: { enrollment: { alternate_availability: @enrollment.alternate_availability, alternate_date: @enrollment.alternate_date, comments: @enrollment.comments, email: @enrollment.email, first_name: @enrollment.first_name, goals: @enrollment.goals, last_name: @enrollment.last_name, phone: @enrollment.phone, preferred_availability: @enrollment.preferred_availability, preferred_date: @enrollment.preferred_date, previous_training: @enrollment.previous_training } }
    end

    assert_redirected_to enrollment_url(Enrollment.last)
  end

  test "should show enrollment" do
    get enrollment_url(@enrollment)
    assert_response :success
  end

  test "should get edit" do
    get edit_enrollment_url(@enrollment)
    assert_response :success
  end

  test "should update enrollment" do
    patch enrollment_url(@enrollment), params: { enrollment: { alternate_availability: @enrollment.alternate_availability, alternate_date: @enrollment.alternate_date, comments: @enrollment.comments, email: @enrollment.email, first_name: @enrollment.first_name, goals: @enrollment.goals, last_name: @enrollment.last_name, phone: @enrollment.phone, preferred_availability: @enrollment.preferred_availability, preferred_date: @enrollment.preferred_date, previous_training: @enrollment.previous_training } }
    assert_redirected_to enrollment_url(@enrollment)
  end

  test "should destroy enrollment" do
    assert_difference("Enrollment.count", -1) do
      delete enrollment_url(@enrollment)
    end

    assert_redirected_to enrollments_url
  end
end
