defmodule Legion.Identity.Information.Registration do
  @moduledoc """
  Represents registrations of users.
  """
  use Legion.Stereotype, :model

  alias Legion.Identity.Information.Registration
  alias Legion.Identity.Auth.Concrete.Scheme
  alias Legion.Internationalization.Locale

  @typedoc """
  The type of the identifier to uniquely reference a user.
  """
  @type id() :: integer()

  @typedoc """
  The type of the name of the user.
  """
  @type username() :: String.t()

  @typedoc """
  Indicates a `Registration` struct or a user identifier.

  Most of the time, the API calls regarding users will use this type.
  """
  @type user_or_id() :: Registration.id() | Registration

  schema "users" do
    field :has_gps_telemetry_consent?, :boolean, default: false
    belongs_to :locale, Locale, foreign_key: :locale_rfc1766, references: :rfc1766, type: :binary
    field :authentication_scheme, Scheme, default: :insecure
    field :inserted_at, :naive_datetime_usec, read_after_writes: true
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:has_gps_telemetry_consent?, :authentication_scheme])
    |> foreign_key_constraint(:locale)
  end
end
