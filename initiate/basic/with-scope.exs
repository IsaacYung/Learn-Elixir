content = "Now is the time"

ip = with {:ok, file} = File.open("passwd.txt"),
      content = IO.read(file, :all),
      :ok = File.close(file),
      [_, uid, gid] = Regex.run(~r/_lp:.*?:(\d+):(d+)/,content)
    do
      "Group: #{gid} User: #{uid}"
    end

IO.puts ip
IO.puts content
