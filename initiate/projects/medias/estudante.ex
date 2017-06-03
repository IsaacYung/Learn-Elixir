defmodule Estudante do
  @moduledoc """
  Define a estrutura Estudante e funções para manipula-lo
  """
  defstruct nome: nil, resultados: []

  @doc """
  Pega o primeiro nome de um Estudante

  ## Parametros
  - `estudante` - Uma estrutura Estudante

  ## Exemplos

  * joao = %Estudante{nome: "João Joaquim"}
  * Estudante.primeiro_nome(joao)
  * "João"
  """
  def primeiro_nome(estudante) do
    estudante.nome
    |> String.split
    |> List.first
  end

  @doc """
  Pega o ultimo nome de um Estudante

  ## Parametros
  - `estudante` - Uma estrutura Estudante

  ## Exemplos

  * joao = %Estudante{nome: "João Joaquim"}
  * Estudante.ultimo_nome(joao)
  * "Joaquim"
  """
  def ultimo_nome(estudante) do
    estudante.nome
    |> String.split
    |> List.last
  end
end
