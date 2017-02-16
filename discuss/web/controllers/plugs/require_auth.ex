defmodule Discuss.Plugs.RequireAuthPlug do
  

  def init(_params) do

  end

  def call(conn, params) do
    if conn.assign[:user] do
      conn
    else
      conn 
      |> put_flash(:error, "You must be logged in!")
      |> redirect(to: Helpers.topic_path(conn, :index))
      |> halt()
    end
  end
end