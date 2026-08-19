defmodule Ethos.Seeds.RomeGuide do
  @moduledoc """
  Seeds the "3 Days in Rome" flagship guide — canonical story/SEO content
  and affiliate booking links. `upsert!/1` is idempotent by slug: re-running
  it against the same owner email updates the existing guide and its
  entries in place rather than creating duplicates.
  """

  import Ecto.Query, warn: false

  alias Ethos.Repo
  alias Ethos.Accounts
  alias Ethos.Accounts.User
  alias Ethos.Guides
  alias Ethos.Guides.Guide
  alias Ethos.Guides.Entry

  @slug "three-days-in-rome-real-trip-guide"
  @title "3 Days in Rome: Colosseum Arena Floor, the Vatican, and the Back Streets of Monti"
  @destination "Rome, Italy"

  @intro """
  Three days in Rome, exactly as we did them — no filler, real verdicts. We based
  ourselves at the Anantara Palazzo Naiadi by Termini, walked almost everywhere,
  took two guided tours that were worth every euro (the Vatican skip-the-line and
  the Colosseum arena floor), ate on side streets rather than piazzas, and still
  had time to rest. If you only have three days, this is the shape of trip we'd
  recommend: one day for the Vatican, one for ancient Rome, one to walk the
  centro storico from the Spanish Steps to Trastevere. Every place below is
  somewhere we actually stayed, toured, walked, or ate — with honest notes on
  what was worth it.
  """

  @entries [
    %{
      day: 1,
      kind: "stay",
      name: "Anantara Palazzo Naiadi Rome",
      verdict: "loved",
      note:
        "Our base for all three days, on Piazza della Repubblica by Termini. Grand old building, quiet rooms, and the rooftop restaurant made our last-night dinner easy. Location is the win: we walked to everything."
    },
    %{
      day: 1,
      kind: "tour",
      name: "Vatican, Sistine Chapel & St. Peter's skip-the-line tour",
      verdict: "loved",
      note:
        "Three hours of non-stop culture and history that primed us for the rest of the trip. The skip-the-line part matters — the general queue was enormous. The Vatican is a walk through history right up to the present day.",
      booking_url:
        "https://www.viator.com/tours/Rome/Skip-the-Line-Group-Tour-of-the-Vatican-Sistine-Chapel-and-St-Peters-Basilica/d511-120123P3",
      booking_label: "Book the Vatican skip-the-line tour"
    },
    %{
      day: 1,
      kind: "food",
      name: "Lunch under the Leonine Wall (Borgo side streets)",
      verdict: "good",
      note:
        "We ate on a side street in the shadow of the wall Pope Leo IV built after the Saracen raid — around 846–852 AD, so nearly 1,200 years old. Skip the places facing the basilica; one street back the food gets better and cheaper."
    },
    %{
      day: 2,
      kind: "tour",
      name: "Colosseum arena floor, Roman Forum & Palatine Hill",
      verdict: "loved",
      note:
        "Breathtaking. Walking through the gladiators' gate onto the arena floor is the tip-of-the-hat moment of the whole trip. The Forum walk shows you the Curia Julia — the Senate house, still standing because it was converted into a church — plus the triumphal arches and views over five of Rome's seven hills.",
      booking_url:
        "https://www.getyourguide.com/rome-l33/rome-colosseum-gladiator-floor-access-roman-forum-tour-t633431/?partner_id=ZA4AIMF&currency=USD&travel_agent=1&cmp=share_to_earn",
      booking_label: "Book the arena-floor tour"
    },
    %{
      day: 2,
      kind: "food",
      name: "Dinner in Monti — the one place still open",
      verdict: "loved",
      note:
        "Most of the neighborhood was closed that night, but one little spot on a side street was open — and I ate a dish I hadn't had since my grandparents made it for me 35 years ago. Monti rewards wandering: pick the street, not the restaurant."
    },
    %{
      day: 3,
      kind: "walk",
      name:
        "Spanish Steps → Trinità dei Monti → Villa Borghese → Trevi → Pantheon → Piazza Navona",
      verdict: "loved",
      note:
        "Our whole final morning on foot: up the Spanish Steps to the church of Trinità dei Monti (the beautiful landmark at the top of the hill), looping through the Villa Borghese park, then down to the Trevi Fountain, the Pantheon, and Piazza Navona. Do it in this order — you descend more than you climb."
    },
    %{
      day: 3,
      kind: "sight",
      name: "Basilica di Santa Maria in Trastevere",
      verdict: "loved",
      note:
        "Crossed the Tiber to light a candle here. One of Rome's oldest churches, golden mosaics, and Trastevere's lanes around it are the right place to land for lunch afterwards."
    },
    %{
      day: 3,
      kind: "food",
      name: "SEEN — rooftop dinner at the Anantara",
      verdict: "loved",
      note:
        "Sushi on a Roman rooftop sounds wrong and tasted right — the quail egg was a nice touch, and the soft-shell crab is my favorite. A calm way to end three full days."
    }
  ]

  @sections [
    %{
      "heading" => "Colosseum arena floor access, explained",
      "body" => """
      Standard Colosseum tickets put you in the galleries; **arena floor access**
      is a separate, limited entry through the Porta Libitinaria — the gladiators'
      gate — onto the reconstructed arena deck. It sells out days ahead in high
      season, and most arena-floor tickets come bundled with the Roman Forum and
      Palatine Hill (they're one archaeological park; keep a full afternoon for
      it). A guided tour is worth it here specifically: the Forum is a field of
      stones without context, and with context it's the center of the world for
      a thousand years. Comfortable shoes; there is almost no shade.
      """
    },
    %{
      "heading" => "Vatican skip-the-line logistics",
      "body" => """
      The Vatican Museums queue regularly runs past two hours; booked entries and
      guided tours use a separate entrance. Three practical notes from doing it:
      dress code is enforced (covered shoulders and knees) for the Sistine Chapel
      and St. Peter's; the museums-to-basilica shortcut is only available on some
      guided tours — otherwise you exit and re-queue for St. Peter's security;
      and mornings are the crowd peak, so early afternoon entries are often
      calmer. Give it three hours minimum. Afterwards, walk one street away from
      the basilica into Borgo for lunch — the side streets under the 9th-century
      Leonine Wall beat anything on the tourist frontage.
      """
    },
    %{
      "heading" => "Where to eat in Monti",
      "body" => """
      Monti is the neighborhood between the Colosseum and Termini — Rome's oldest
      rione, now its most walkable dinner district. The pattern that worked for
      us: skip anywhere with a host waving menus on Via dei Serpenti's busiest
      corners and turn onto the smaller side streets, where kitchens cook Roman
      classics — cacio e pepe, carbonara, saltimbocca — for people who live
      there. Many kitchens close one night a week (often Monday); if the street
      looks shut, keep walking — the one place still open is usually open
      because locals keep it that way.
      """
    },
    %{
      "heading" => "Making three days work on foot from Termini",
      "body" => """
      Basing near Termini gets a bad rap, but it worked: metro line A runs
      direct to the Vatican side (Ottaviano), the Colosseum and Monti are a
      20-minute walk, and the centro storico loop — Spanish Steps, Trevi,
      Pantheon, Piazza Navona — is entirely walkable in a morning. Our shape:
      Day 1 Vatican (tour + Borgo lunch), Day 2 ancient Rome (arena floor +
      Forum + Monti dinner), Day 3 the walking loop ending across the Tiber in
      Trastevere. Total walking: 8–12km a day. Build in an afternoon rest — Rome
      rewards evenings, and August heat is real.
      """
    }
  ]

  @faq [
    %{
      "question" => "Is the Colosseum arena floor tour worth it?",
      "answer" =>
        "Yes — it was the single best moment of our trip. You enter through the gladiators' gate onto the arena deck itself, which regular tickets don't include. Book several days ahead; it's capacity-limited and sells out."
    },
    %{
      "question" => "How many days do you need in Rome?",
      "answer" =>
        "Three full days covers the Vatican, ancient Rome (Colosseum, Forum, Palatine), and the historic center's walking loop without rushing. You could fill a week, but three days makes a complete trip."
    },
    %{
      "question" => "Do you need a guided tour for the Vatican?",
      "answer" =>
        "You don't need one, but the skip-the-line entry alone can save two hours, and our three-hour guided tour turned the museums from overwhelming into coherent. If you take one tour in Rome, make it the Vatican or the Colosseum."
    },
    %{
      "question" => "Where should you stay in Rome for a first visit?",
      "answer" =>
        "Anywhere you can walk from. We stayed at the Anantara Palazzo Naiadi by Piazza della Repubblica — near Termini for airport trains and metro, and a walkable base for everything in this guide."
    },
    %{
      "question" => "Is the area around Termini a good place to eat?",
      "answer" =>
        "Breakfast and shopping around Termini worked fine for us, but for dinner walk 15 minutes into Monti — the side streets there had the best food of our trip."
    },
    %{
      "question" => "What's the walking route for the classic Rome sights?",
      "answer" =>
        "Start at the Spanish Steps, climb to Trinità dei Monti, loop through Villa Borghese, then descend to the Trevi Fountain, Pantheon, and Piazza Navona, and cross the Tiber to finish in Trastevere. It's a comfortable half-day on foot, mostly downhill if done in that order."
    }
  ]

  @photos [
    %{
      label: "arch-of-constantine",
      title: "Arch of Constantine",
      description:
        "The triple Arch of Constantine beside the Colosseum, medallions and attic inscription in full sun."
    },
    %{
      label: "arch-of-titus-menorah-relief",
      title: "Arch of Titus — Spoils of Jerusalem",
      description:
        "The interior relief of the Arch of Titus showing the triumphal procession carrying the menorah from the Temple in Jerusalem."
    },
    %{
      label: "colosseum-exterior-arches",
      title: "Colosseum, looking up",
      description: "The travertine arcades of the Colosseum stacked against a blue summer sky."
    },
    %{
      label: "colosseum-hypogeum",
      title: "The hypogeum",
      description:
        "The maze of corridors and lift shafts beneath where the arena floor once stood."
    },
    %{
      label: "colosseum-interior-wide",
      title: "Inside the Colosseum",
      description:
        "Wide view from near arena level — hypogeum, seating tiers, and the outer wall in the summer haze."
    },
    %{
      label: "arch-across-the-forum",
      title: "Across the Forum",
      description: "A triumphal arch seen through the trees and tall grass of the Roman Forum."
    },
    %{
      label: "palatine-forum-view",
      title: "Over the Forum rooftops",
      description:
        "Looking out from the Palatine over ancient brick, pines, and the domes of the city."
    },
    %{
      label: "vittoriano-and-domes",
      title: "Domes and the Vittoriano",
      description:
        "Baroque domes in the foreground with the winged victories of the Altare della Patria behind."
    },
    %{
      label: "trevi-fountain",
      title: "Trevi Fountain",
      description:
        "Oceanus on his shell chariot, tritons and sea-horses over the travertine rockwork, in strong afternoon sun."
    },
    %{
      label: "obelisk-and-church",
      title: "Obelisk on the final-day walk",
      description:
        "A hieroglyph-covered Egyptian obelisk on its Roman base, a Baroque dome under restoration behind."
    },
    %{
      label: "santa-maria-in-trastevere",
      title: "Santa Maria in Trastevere",
      description:
        "The golden 12th-century mosaic and Romanesque bell tower of the basilica where we lit a candle."
    },
    %{
      label: "food-flatbread-lunch",
      title: "Side-street lunch",
      description:
        "Grilled stuffed flatbread with melted cheese and a pile of fresh arugula — the kind of lunch you find one street off the main drag."
    },
    %{
      label: "street-art-michelangelo",
      title: "MICHELANGELO",
      description:
        "Roman street art: Michelangelo in a Ninja Turtle mask. The Renaissance fights back."
    }
  ]

  @doc """
  Creates or updates the Rome flagship guide under the user with the given
  email (creating that user, with a random password, if they don't exist
  yet). Idempotent by slug — safe to run repeatedly.
  """
  def upsert!(owner_email) when is_binary(owner_email) do
    user = find_or_create_user!(owner_email)
    guide = find_or_insert_guide!(user)

    {:ok, guide} =
      Repo.transaction(fn ->
        guide =
          guide
          |> Guide.changeset(%{title: @title, destination: @destination})
          |> Guide.seo_changeset(%{intro: @intro, sections: @sections, faq: @faq})
          |> Ecto.Changeset.put_change(:slug, @slug)
          |> Repo.update!()

        {:ok, guide} = Guides.update_guide_photos(guide, photo_attrs())

        replace_entries!(guide)

        {:ok, published} = Guides.publish_guide(guide)
        published
      end)

    Guides.get_guide!(guide.id)
  end

  defp photo_attrs do
    Enum.map(@photos, fn %{label: label, title: title, description: description} ->
      %{
        "src" => "/photos/rome/#{label}.jpg",
        "thumb" => "/photos/rome/#{label}_thumb.jpg",
        "title" => title,
        "description" => description
      }
    end)
  end

  defp find_or_create_user!(email) do
    case Accounts.get_user_by_email(email) do
      %User{} = user ->
        user

      nil ->
        if Application.get_env(:ethos, :env) in [:dev, :test] do
          password = :crypto.strong_rand_bytes(24) |> Base.encode64()
          {:ok, user} = Accounts.register_user(%{email: email, password: password})
          user
        else
          raise "owner account #{email} not found — register it first"
        end
    end
  end

  defp find_or_insert_guide!(user) do
    case Repo.get_by(Guide, slug: @slug) do
      %Guide{} = guide ->
        guide

      nil ->
        %Guide{user_id: user.id}
        |> Guide.changeset(%{title: @title, destination: @destination})
        |> Ecto.Changeset.put_change(:slug, @slug)
        |> Repo.insert!()
    end
  end

  @arena_floor_entry_name "Colosseum arena floor, Roman Forum & Palatine Hill"

  @arena_floor_enrichment %{
    "links" => [
      %{
        "title" => "The Roman Guy — Colosseum arena floor tour",
        "url" => "https://theromanguy.com/tours/italy/rome/colosseum-tour-arena-floor"
      }
    ],
    "source" => "seed"
  }

  defp replace_entries!(guide) do
    Repo.delete_all(from e in Entry, where: e.guide_id == ^guide.id)

    Enum.each(@entries, fn attrs ->
      {:ok, entry} =
        Guides.create_entry(guide, Map.put(attrs, :source, "import"), :privileged)

      if entry.name == @arena_floor_entry_name do
        {:ok, _entry} = Guides.set_entry_enrichment(entry, @arena_floor_enrichment)
      end
    end)
  end
end
