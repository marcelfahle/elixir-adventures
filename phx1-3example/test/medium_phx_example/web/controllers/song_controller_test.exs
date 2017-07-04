defmodule MediumPhxExample.Web.SongControllerTest do
  use MediumPhxExample.Web.ConnCase

  alias MediumPhxExample.Audio
  alias MediumPhxExample.Audio.Song

  @create_attrs %{duration: 42, name: "some name"}
  @update_attrs %{duration: 43, name: "some updated name"}
  @invalid_attrs %{duration: nil, name: nil}

  def fixture(:song) do
    {:ok, song} = Audio.create_song(@create_attrs)
    song
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, song_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "creates song and renders song when data is valid", %{conn: conn} do
    conn = post conn, song_path(conn, :create), song: @create_attrs
    assert %{"id" => id} = json_response(conn, 201)["data"]

    conn = get conn, song_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "duration" => 42,
      "name" => "some name"}
  end

  test "does not create song and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, song_path(conn, :create), song: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates chosen song and renders song when data is valid", %{conn: conn} do
    %Song{id: id} = song = fixture(:song)
    conn = put conn, song_path(conn, :update, song), song: @update_attrs
    assert %{"id" => ^id} = json_response(conn, 200)["data"]

    conn = get conn, song_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "duration" => 43,
      "name" => "some updated name"}
  end

  test "does not update chosen song and renders errors when data is invalid", %{conn: conn} do
    song = fixture(:song)
    conn = put conn, song_path(conn, :update, song), song: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen song", %{conn: conn} do
    song = fixture(:song)
    conn = delete conn, song_path(conn, :delete, song)
    assert response(conn, 204)
    assert_error_sent 404, fn ->
      get conn, song_path(conn, :show, song)
    end
  end
end
