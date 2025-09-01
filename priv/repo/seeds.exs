# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CursoGuia.Repo.insert!(%CursoGuia.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias CursoGuia.Repo
alias CursoGuia.Courses
alias CursoGuia.Courses.Course
alias CursoGuia.Platforms
alias CursoGuia.Platforms.Platform

case Platforms.create_platform(%{
       name: "Hotmart",
       logo:
         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvpm4doKmXcVu6Lw4RbeDf-vthN1Z8r5zsTQ&s",
       href: "http://hotmart.com"
     }) do
  {:ok, platform} -> IO.puts("Created platform #{platform.name}")
  {:error, changeset} -> IO.inspect(changeset.errors)
end

case Platforms.create_platform(%{
       name: "Kiwify",
       logo:
         "https://play-lh.googleusercontent.com/VJOW3rillBsN_OOH-U7DHesvzjinqNNceRBeCFpzXa7rOahD5LUb4YAhV7QQvwzFYgs",
       href: "https://kiwify.com.br/"
     }) do
  {:ok, platform} -> IO.puts("Created platform #{platform.name}")
  {:error, changeset} -> IO.inspect(changeset.errors)
end

case Courses.create_course(%{
       title: "Elxpro BR",
       description: "Learn the basics of Elixir programming.",
       cover:
         "https://static-media.hotmart.com/WiJmWcZpgYGRr8Q5ogTtLnk0Hjg=/300x300/smart/filters:format(webp):background_color(white)/hotmart/product_pictures/1ff67a67-4901-4834-afe4-8d6d3e1a2aa5/Ativo384x.png?w=920",
       price: 100,
       platform_id: 1
     }) do
  {:ok, course} -> IO.puts("Created course #{course.title}")
  {:error, changeset} -> IO.inspect(changeset.errors)
end

case Courses.create_course(%{
       title: "Golpe em Idosos [Turma Abril]",
       description: "Aprenda a cuidar de idosos com respeito e dignidade.",
       cover:
         "https://img.freepik.com/vetores-premium/capa-do-cassino-3d-caca-niqueis-e-roleta-com-cartas-arte-do-plano-de-fundo-da-cena-ilustracao-vetorial_3482-4279.jpg",
       price: 100,
       platform_id: 2
     }) do
  {:ok, course} -> IO.puts("Created course #{course.title}")
  {:error, changeset} -> IO.inspect(changeset.errors)
end
