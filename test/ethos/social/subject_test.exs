defmodule Ethos.Social.SubjectTest do
  use Ethos.DataCase, async: true

  import Ethos.GuidesFixtures

  alias Ethos.Social.Subject

  describe "types/0 and valid_type?/1" do
    test "exactly three types" do
      assert Subject.types() == ["place", "guide", "collection"]
    end

    test "accepts the three and nothing else" do
      assert Subject.valid_type?("place")
      assert Subject.valid_type?("guide")
      assert Subject.valid_type?("collection")
      refute Subject.valid_type?("entry")
      refute Subject.valid_type?("Place")
      refute Subject.valid_type?(nil)
    end
  end

  describe "type/1 and ref/1" do
    test "a place" do
      place = %Ethos.Places.Place{id: 7}
      assert Subject.type(place) == "place"
      assert Subject.ref(place) == {"place", 7}
    end

    test "a guide" do
      guide = %Ethos.Guides.Guide{id: 9}
      assert Subject.type(guide) == "guide"
      assert Subject.ref(guide) == {"guide", 9}
    end

    test "a collection" do
      collection = %Ethos.Collections.Collection{id: 11}
      assert Subject.type(collection) == "collection"
      assert Subject.ref(collection) == {"collection", 11}
    end
  end

  describe "get!/2" do
    test "loads a guide by type and id" do
      guide = guide_fixture()
      assert Subject.get!("guide", guide.id).id == guide.id
    end

    test "raises for a missing row" do
      assert_raise Ecto.NoResultsError, fn -> Subject.get!("guide", 0) end
    end

    test "raises for an unknown type rather than guessing" do
      assert_raise FunctionClauseError, fn -> Subject.get!("entry", 1) end
    end
  end
end
