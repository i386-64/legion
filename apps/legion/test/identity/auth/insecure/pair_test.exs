defmodule Legion.Identity.Auth.Insecure.PairTest do
  @moduledoc false
  use Legion.DataCase

  import Ecto.Changeset, only: [get_change: 3]

  alias Legion.Identity.Auth.Insecure.Pair
  alias Legion.Identity.Auth.Algorithm.Keccak

  @env Application.get_env(:legion, Legion.Identity.Auth.Insecure)
  @username_length Keyword.fetch!(@env, :username_length)
  @password_length Keyword.fetch!(@env, :password_length)

  @valid_attrs %{
    user_id: 1,
    username: random_string(@username_length),
    password_hash: Keccak.hash(random_string(7))
  }

  test "changeset with valid attributes" do
    changeset = Pair.changeset(%Pair{}, @valid_attrs)

    assert changeset.valid?
  end

  test "changeset without user identifier" do
    params = params_by_dropping_key(@valid_attrs, :user_id)
    changeset = Pair.changeset(%Pair{}, params)

    refute changeset.valid?
  end

  test "changeset without username" do
    params = params_by_dropping_key(@valid_attrs, :username)
    changeset = Pair.changeset(%Pair{}, params)

    refute changeset.valid?
  end

  test "changeset without password" do
    params = params_by_dropping_key(@valid_attrs, :password_hash)
    changeset = Pair.changeset(%Pair{}, params)

    refute changeset.valid?
  end

  test "hashes password with a digestion algorithm" do
    changeset = Pair.changeset(%Pair{}, @valid_attrs)

    assert get_change(changeset, :password_digest, false)
  end

  test "changeset with short username" do
    username = random_string(Enum.min(@username_length) - 1)
    params = params_by_updating_key(@valid_attrs, :username, username)
    changeset = Pair.changeset(%Pair{}, params)

    refute changeset.valid?
  end

  test "changeset with long username" do
    username = random_string(Enum.max(@username_length) + 1)
    params = params_by_updating_key(@valid_attrs, :username, username)
    changeset = Pair.changeset(%Pair{}, params)

    refute changeset.valid?
  end

  test "changeset with password having unknown length" do
    password_hash = random_string(@password_length + 1)
    params = params_by_updating_key(@valid_attrs, :password_hash, password_hash)
    changeset = Pair.changeset(%Pair{}, params)

    refute changeset.valid?
  end

  test "changeset is invalid with default params either" do
    refute Pair.changeset(%Pair{}).valid?
  end

  defp params_by_dropping_key(attrs, key),
    do: Map.delete(attrs, key)

  defp params_by_updating_key(attrs, key, value),
    do: Map.replace!(attrs, key, value)
end
