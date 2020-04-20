defmodule Olc.AccountsTest do
  use Olc.DataCase

  alias Olc.Accounts

  describe "users" do
    alias Olc.Accounts.User

    @valid_attrs %{bio: "some bio", email: "some email", full_name: "some full_name", nickname: "some nickname"}
    @update_attrs %{bio: "some updated bio", email: "some updated email", full_name: "some updated full_name", nickname: "some updated nickname"}
    @invalid_attrs %{bio: nil, email: nil, full_name: nil, nickname: nil}

    def user_fixture(attrs \\ %{}) do
      Olc.Factory.insert(:user, attrs)
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.bio == "some bio"
      assert user.email == "some email"
      assert user.full_name == "some full_name"
      assert user.nickname == "some nickname"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.bio == "some updated bio"
      assert user.email == "some updated email"
      assert user.full_name == "some updated full_name"
      assert user.nickname == "some updated nickname"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
