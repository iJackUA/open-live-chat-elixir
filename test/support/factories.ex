defmodule Olc.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: Olc.Repo

  def user_factory do
    %Olc.Accounts.User{
      bio: Faker.Lorem.paragraph(2..10),
      email: Faker.Internet.email(),
      full_name: "#{Faker.Name.first_name()} #{Faker.Name.last_name()}",
      nickname: Faker.Internet.user_name()
    }
  end

end
