defmodule Thumfix do
  @moduledoc """
    Thumfix.run %{source: "/home/isaac/Desktop/url", output: "/home/isaac/Desktop/images"}
  """

  @regex ~r/https:\/\/staticcdns3.bidu.com.br\/jamal\/uploads\/[0-9]*\/[0-9]*\/[0-9]*\/(?<name>.*)/

  def read_url(file) do
    case File.read(file) do
     {:ok, body}      -> parser(body)
     {:error, reason} -> "Error when try read the file because #{reason}"
    end
  end

  def parser(body) do
    urls = body
    urls = String.split(urls, "\n")
    urls -- ["", ""]
  end

  def get(url) do
    url = Regex.replace(~r/\-[0-9]*x[0-9]*/, url, "")
    response = HTTPotion.get(URI.encode(url))

    cond do
      !Map.has_key? response, :message ->
        cond do
          response.status_code == 200 -> {:ok, response.body}
          response.status_code == 404 -> {:error, "Not found"}
          response.status_code == 301 -> {:error, "Redirected"}
        end
      true -> {:error, "Error"}
    end
  end

  def download_image(url) do
    captured = Regex.named_captures(@regex, url)
    case get(url) do
      {:ok, body} -> [body, captured["name"]]
      {:error, reason} -> {:error, reason, captured["name"]}
    end
  end

  def save_image([image, name], path) do
    name = Regex.replace(~r/\-[0-9]*x[0-9]*/, name, "")
    case File.write("#{path}/#{name}", image) do
      :ok -> IO.puts "✓ Saved #{name}"
      {:error, reason} -> IO.puts "Error when write #{reason}"
    end
  end

  def save_image({:error, reason, name}, _path) do
    [:gold, "× Error when try download file, #{reason} (#{name})"]
    |> Bunt.puts
  end

  def download([], _path) do
    [:lightcyan, "Finished with successful"]
    |> Bunt.puts
  end

  def download([head | tail], path) do
    save_image(download_image(head), path)
    download(tail, path)
  end

  def run(%{source: file, output: path}) do
    IO.puts "  Start downloading...\n"
    download(read_url(file), path)
  end
end
