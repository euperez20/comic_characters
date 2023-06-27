require "test_helper"

class CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:one)
  end

  test "should get index" do
    get characters_url
    assert_response :success
  end

  test "should get new" do
    get new_character_url
    assert_response :success
  end

  test "should create character" do
    assert_difference("Character.count") do
      post characters_url, params: { character: { api_detail_url: @character.api_detail_url, count_of_issue_appearances: @character.count_of_issue_appearances, deck: @character.deck, description: @character.description, gender: @character.gender, image: @character.image, name: @character.name, origin: @character.origin, power: @character.power, publisher: @character.publisher, real_name: @character.real_name, string: @character.string } }
    end

    assert_redirected_to character_url(Character.last)
  end

  test "should show character" do
    get character_url(@character)
    assert_response :success
  end

  test "should get edit" do
    get edit_character_url(@character)
    assert_response :success
  end

  test "should update character" do
    patch character_url(@character), params: { character: { api_detail_url: @character.api_detail_url, count_of_issue_appearances: @character.count_of_issue_appearances, deck: @character.deck, description: @character.description, gender: @character.gender, image: @character.image, name: @character.name, origin: @character.origin, power: @character.power, publisher: @character.publisher, real_name: @character.real_name, string: @character.string } }
    assert_redirected_to character_url(@character)
  end

  test "should destroy character" do
    assert_difference("Character.count", -1) do
      delete character_url(@character)
    end

    assert_redirected_to characters_url
  end
end
