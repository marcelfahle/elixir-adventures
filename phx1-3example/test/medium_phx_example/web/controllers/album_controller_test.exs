defmodule MediumPhxExample.Web.AlbumControllerTest do
  use MediumPhxExample.Web.ConnCase

  alias MediumPhxExample.Audio
  alias MediumPhxExample.Audio.Album

  @create_attrs %{name: "some name", release: %DateTime{calendar: Calendar.ISO, day: 17, hour: 14, microsecond: {0, 6}, minute: 0, month: 4, second: 0, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2010, zone_abbr: "UTC"}}
  @update_attrs %{name: "some updated name", release: %DateTime{calendar: Calendar.ISO, day: 18, hour: 15, microsecond: {0, 6}, minute: 1, month: 5, second: 1, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2011, zone_abbr: "UTC"}}
  @invalid_attrs %{name: nil, release: nil}

  def fixture(:album) do
    {:ok, album} = Audio.create_album(@create_attrs)
    album
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, album_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "creates album and renders album when data is valid", %{conn: conn} do
    conn = post conn, album_path(conn, :create), album: @create_attrs
    assert %{"id" => id} = json_response(conn, 201)["data"]

    conn = get conn, album_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "name" => "some name",
      "release" => %DateTime{calendar: Calendar.ISO, day: 17, hour: 14, microsecond: {0, 6}, minute: 0, month: 4, second: 0, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2010, zone_abbr: "UTC"}}
  end

  test "does not create album and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, album_path(conn, :create), album: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates chosen album and renders album when data is valid", %{conn: conn} do
    %Album{id: id} = album = fixture(:album)
    conn = put conn, album_path(conn, :update, album), album: @update_attrs
    assert %{"id" => ^id} = json_response(conn, 200)["data"]

    conn = get conn, album_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "name" => "some updated name",
      "release" => %DateTime{calendar: Calendar.ISO, day: 18, hour: 15, microsecond: {0, 6}, minute: 1, month: 5, second: 1, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2011, zone_abbr: "UTC"}}
  end

  test "does not update chosen album and renders errors when data is invalid", %{conn: conn} do
    album = fixture(:album)
    conn = put conn, album_path(conn, :update, album), album: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen album", %{conn: conn} do
    album = fixture(:album)
    conn = delete conn, album_path(conn, :delete, album)
    assert response(conn, 204)
    assert_error_sent 404, fn ->
      get conn, album_path(conn, :show, album)
    end
  end
end
