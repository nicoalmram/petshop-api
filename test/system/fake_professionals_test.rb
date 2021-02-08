require "application_system_test_case"

class FakeProfessionalsTest < ApplicationSystemTestCase
  setup do
    @fake_professional = fake_professionals(:one)
  end

  test "visiting the index" do
    visit fake_professionals_url
    assert_selector "h1", text: "Fake Professionals"
  end

  test "creating a Fake professional" do
    visit fake_professionals_url
    click_on "New Fake Professional"

    fill_in "Comment", with: @fake_professional.comment
    fill_in "Name", with: @fake_professional.name
    click_on "Create Fake professional"

    assert_text "Fake professional was successfully created"
    click_on "Back"
  end

  test "updating a Fake professional" do
    visit fake_professionals_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @fake_professional.comment
    fill_in "Name", with: @fake_professional.name
    click_on "Update Fake professional"

    assert_text "Fake professional was successfully updated"
    click_on "Back"
  end

  test "destroying a Fake professional" do
    visit fake_professionals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fake professional was successfully destroyed"
  end
end
