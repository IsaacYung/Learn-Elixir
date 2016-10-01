nome = "Fulano"

# if nome == "Fulano" do
#   IO.puts "È Fulano"
# else
#   IO.puts "Não é Fulano"
# end

# unless nome == "Fulano" do
#   IO.puts "Não é Fulano"
# end

# case nome do
#   "Fulano" ->
#     IO.puts "É Fulano"
# end

# case File.read("hello.exsx") do
#   {:ok, content } ->
#     IO.puts content
#   {:error, error} ->
#     IO.puts "Ocorreu o erro #{error}"
# end

# case File.read("hello.exsx") do
#   {:ok, content } ->
#     IO.puts content
#
#   {:error, :enoent} ->
#     IO.puts "Arquivo não existe"
#
#   {:error, error} ->
#     IO.puts "Ocorreu o erro #{error}"
# end

# case 5 do
#   num ->
#     IO.puts "Número é #{num}"
# end

# case 10 do
#   num when num < 10 ->
#     IO.puts "Menor que dez"
#   _num ->
#     IO.puts "Maior que dez"
# end

# cond do
#   2 + 2 == 5 ->
#     IO.puts "Não vai printar"
#
#   nome == "Fulanox" ->
#     IO.puts "Não vai chegar aqui"
#
#   :otherwise ->
#     IO.puts "Não caiu em nada"
# end

# if nome == "Fulano", do: IO.puts "È o Fulano"
