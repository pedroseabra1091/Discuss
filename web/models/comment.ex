defmodule Discuss.Comment do
  use Discuss.Web, :model

  # Poison is the library that Phoenix uses to transform models into JSON data
  @derive {Poison.Encoder, only: [:content, :user]}

  schema "comments" do

    field :content, :string
    belongs_to :user, Discuss.User
    belongs_to :topic, Discuss.Topic

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
