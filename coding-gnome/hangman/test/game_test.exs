defmodule GameTest do
  use ExUnit.Case

  alias Hangman.Game

  test "new_game returns structure" do
    game = Game.new_game()

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

  test "game letters don't contain special caracters" do
    game = Game.new_game()

    Enum.map(game.letters, fn x ->
      assert String.match?(x, ~r/[a-z]/)
    end)
  end

  test "state isn't change for :won or :lost games" do
    for state <- [:won, :lost ] do
      game = Game.new_game() |> Map.put(:game_state, state)
      assert ^game = Game.make_move(game, "x")
    end
  end

  test "first occurence of letter is not already used" do
    game = Game.new_game()
    game = Game.make_move(game, "x")
    assert game.game_state != :already_used
  end

  test "second occurence of letter is already used" do
    game = Game.new_game()
    game = Game.make_move(game, "x")
    assert game.game_state != :already_used
    game = Game.make_move(game, "x")
    assert game.game_state == :already_used
  end

  test "a good guess is recognized" do
    game = Game.new_game("wibble")
    game = Game.make_move(game, "w")
    assert game.game_state == :good_guess
    assert game.turns_left == 7
  end


  test "a guessed word is a won game" do
    moves = [
      {"w", :good_guess}, 
      {"i", :good_guess}, 
      {"b", :good_guess}, 
      {"l", :good_guess}, 
      {"e", :won}
    ]
    game = Game.new_game("wibble")

    Enum.reduce(moves, game, fn({guess, state}, game) ->
      game = Game.make_move(game, guess)
      assert game.game_state == state
      game
    end)
  end

  
  test "bad guess is recognized" do
    game = Game.new_game("wibble")
    game  = Game.make_move(game, "x")
    assert game.game_state == :bad_guess
    assert game.turns_left == 6
  end

  test "lost game is recognized" do
    moves = [
      {"a", :bad_guess},
      {"b", :bad_guess},
      {"c", :bad_guess},
      {"d", :bad_guess},
      {"e", :bad_guess},
      {"f", :bad_guess},
      {"g", :lost}
    ]
    game = Game.new_game("w")

    moves
    |> Enum.with_index()
    |> Enum.reduce( game , fn ({{guess, state}, index}, game) ->
        game = Game.make_move(game, guess)
        assert game.game_state == state
        assert game.turns_left == 7 - (index + 1)
        game
      end)
  end

  
  
end
