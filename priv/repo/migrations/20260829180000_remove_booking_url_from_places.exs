defmodule Ethos.Repo.Migrations.RemoveBookingUrlFromPlaces do
  use Ecto.Migration

  # `places.booking_url` was never written. Places are inserted through exactly
  # one function, `Places.upsert_place!/1`, whose only two callers are the JSON
  # seed loader and the hand-written Connecticut module — and the string
  # `booking_url` appears in neither the seed corpus nor that module. The
  # template's CTA was guarded on a valid http(s) URL, so it never rendered in
  # any environment.
  #
  # Not to be confused with `entries.booking_url`, a different column on a
  # different table, which IS populated (the Rome guide) and IS live.
  #
  # An explicit type keeps `down` reversible.
  def change do
    alter table(:places) do
      remove :booking_url, :string
    end
  end
end
