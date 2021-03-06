defmodule Rumbl.User do
  use Rumbl.Web, :model

  schema "users" do
    field :first_name, :string
    field :name, :string
    field :age_min, :integer
    field :age_max, :integer
    field :gender, :string
    field :email, :string

    field :fb_id, :string
    field :fb_token, :string
    field :fb_expires, :float

    has_many :videos, Rumbl.Video
    has_many :annotations, Rumbl.Annotation

    has_many :groups, Rumbl.GroupUser
    has_many :messages, Rumbl.GroupMessage
    has_many :proposals, Rumbl.GroupVideoProposal
    has_many :proposal_votes, Rumbl.GroupVPVote

    timestamps
  end

  @allowed_fields ~w(first_name name gender age_min age_max fb_id)

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @allowed_fields)
    |> unique_constraint(:fb_id) # TODO handle error from this contstraint
  end
end