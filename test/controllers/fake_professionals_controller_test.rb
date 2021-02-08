require "test_helper"

class FakeProfessionalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fake_professional = fake_professionals(:one)
  end

  test "should get index" do
    get fake_professionals_url
    assert_response :success
  end

  test "should get new" do
    get new_fake_professional_url
    assert_response :success
  end

  test "should create fake_professional" do
    assert_difference('FakeProfessional.count') do
      post fake_professionals_url, params: { fake_professional: { comment: @fake_professional.comment, name: @fake_professional.name } }
    end

    assert_redirected_to fake_professional_url(FakeProfessional.last)
  end

  test "should show fake_professional" do
    get fake_professional_url(@fake_professional)
    assert_response :success
  end

  test "should get edit" do
    get edit_fake_professional_url(@fake_professional)
    assert_response :success
  end

  test "should update fake_professional" do
    patch fake_professional_url(@fake_professional), params: { fake_professional: { comment: @fake_professional.comment, name: @fake_professional.name } }
    assert_redirected_to fake_professional_url(@fake_professional)
  end

  test "should destroy fake_professional" do
    assert_difference('FakeProfessional.count', -1) do
      delete fake_professional_url(@fake_professional)
    end

    assert_redirected_to fake_professionals_url
  end
end
