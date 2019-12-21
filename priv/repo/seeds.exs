# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ThreeLittlePigs.Repo.insert!(%ThreeLittlePigs.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias ThreeLittlePigs.{Repo, Type}

categories = %{
  "straw" => "what do we do that just about hangs together, but could topple over at any minute? (e.g. \“our deployment script is very manual, and prone to error – we could break production very easily\”)",
  "sticks" => "what do we do that is pretty solid, but could be improved? (e.g. \“our automated tests are pretty good, but sometime they fail for no reason, and we have to run them, which is a pain\”)",
  "bricks" => "what do we do that is rock solid? (e.g. \“our automated deployment and cutover has never failed. It rocks\”)"
}

Enum.each(categories, fn {material, description} ->
  Type
  |> struct(%{
    name: "House of #{material}",
    description: description,
    image_name: "#{material}_house.png"
  })
  |> Repo.insert!()
end)
