defmodule Calculador do
  @moduledoc """
  Define um modulo Calculador e executa funções
  """

  @doc """
  Inicia o sistema para processar alguns resultados
  """
  def start() do
    joao = %Estudante{nome: "João Joaquim", resultados: build_subjects([5.2, 3.9, 2.7, 9.8])}
    maria = %Estudante{nome: "Maria Silva", resultados: build_subjects([8.4, 7.5, 9.4, 2.8])}
    pedro = %Estudante{nome: "Pedro Pedrada", resultados: build_subjects([1.3, 8.5, 8.9, 7.6])}
    kaua = %Estudante{nome: "Kauã Comboinhas", resultados: build_subjects([5.4, 4.9, 2.2, 3.8])}

    resultado = calcular([joao, maria, pedro, kaua])
    melhor = melhor_resultado(resultado)

    {resultado, melhor}
  end

  @doc """
  Pega todos estudantes com suas medias

  ## Parametros

  - `estudante` - Uma lista de estruturas Estudante
  """
  defp calcular(estudante) do
    estudante
    |> Enum.map(&(
      %{
        primeiro_nome: Estudante.primeiro_nome(&1),
        ultimo_nome: Estudante.ultimo_nome(&1),
        media: media(&1)
      }
    ))
  end

  @doc """
  Calcula a media de um Estudante

  ## Parametros

  - `estudante` - Uma estrutura Estudante
  """
  defp media(estudante) do
    total = Enum.count(estudante.resultados)

    resultado = estudante.resultados
    |> Enum.map(&(&1.resultado))
    |> Enum.reduce(&(&1 + &2))

    Float.ceil(resultado / total, 2)
  end

  @doc """
  Pega a maior media

  ## Parametros

  - `estudante` - Uma lista de estudantes com suas medias
  """
  defp melhor_resultado(estudante) do
    melhor = estudante
    |> Enum.map(&(&1.media))
    |> Enum.max

    estudante
    |> Enum.filter(&(&1.media === melhor))
  end

  @doc """
  Constroi alguns assuntos e alguns resultados aleatorios

  ## Parametros

  - `resultados` - Uma lista de resultados
  """
  defp build_subjects(resultados) do
    assuntos = ["Matemática", "Português", "Geografia", "História"]

    assuntos
    |> Enum.map(&(%Assunto{nome: &1, resultado: Enum.random(resultados)}))
  end
end
