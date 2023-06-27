require "application_system_test_case"

class CharactersTest < ApplicationSystemTestCase
  setup do
    @character = characters(:one)
  end

  test "visiting the index" do
    visit characters_url
    assert_selector "h1", text: "Characters"
  end

  test "should create character" do
    visit characters_url
    click_on "New character"

    fill_in "Api detail url", with: @character.api_detail_url
    fill_in "Count of issue appearances", with: @character.count_of_issue_appearances
    fill_in "Deck", with: @character.deck
    fill_in "Description", with: @character.description
    fill_in "Gender", with: @character.gender
    fill_in "Image", with: @character.image
    fill_in "Name", with: @character.name
    fill_in "Origin", with: @character.origin
    fill_in "Power", with: @character.power
    fill_in "Publisher", with: @character.publisher
    fill_in "Real name", with: @character.real_name
    fill_in "String", with: @character.string
    click_on "Create Character"

    assert_text "Character was successfully created"
    click_on "Back"
  end

  test "should update Character" do
    visit character_url(@character)
    click_on "Edit this character", match: :first

    fill_in "Api detail url", with: @character.api_detail_url
    fill_in "Count of issue appearances", with: @character.count_of_issue_appearances
    fill_in "Deck", with: @character.deck
    fill_in "Description", with: @character.description
    fill_in "Gender", with: @character.gender
    fill_in "Image", with: @character.image
    fill_in "Name", with: @character.name
    fill_in "Origin", with: @character.origin
    fill_in "Power", with: @character.power
    fill_in "Publisher", with: @character.publisher
    fill_in "Real name", with: @character.real_name
    fill_in "String", with: @character.string
    click_on "Update Character"

    assert_text "Character was successfully updated"
    click_on "Back"
  end

  test "should destroy Character" do
    visit character_url(@character)
    click_on "Destroy this character", match: :first

    assert_text "Character was successfully destroyed"
  end
end
