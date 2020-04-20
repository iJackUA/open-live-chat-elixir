defmodule OlcWeb.UserView do
  use OlcWeb, :view
  alias OlcWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      nickname: user.nickname,
      email: user.email,
      full_name: user.full_name,
      bio: user.bio}
  end
end
