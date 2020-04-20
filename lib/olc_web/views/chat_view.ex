defmodule OlcWeb.ChatView do
  use OlcWeb, :view
  alias OlcWeb.ChatView

  def render("index.json", %{chats: chats}) do
    %{data: render_many(chats, ChatView, "chat.json")}
  end

  def render("show.json", %{chat: chat}) do
    %{data: render_one(chat, ChatView, "chat.json")}
  end

  def render("chat.json", %{chat: chat}) do
    %{id: chat.id,
      public_id: chat.public_id,
      title: chat.title,
      description: chat.description,
      participants: chat.participants,
      settings: chat.settings}
  end
end
