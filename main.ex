import ObjectDimension

defmodule CLI do
  def call do
    {args, _, _} = System.argv() |> OptionParser.parse(strict: [ra1: :integer, ra2: :integer, full: :boolean])

    is_full_result = Keyword.get(args, :full, false)
    ra1 = Keyword.get(args, :ra1)
    ra2 = Keyword.get(args, :ra2)

    unless !(ra1 |> Integer.digits |> length >= 7 and ra2 |> Integer.digits |> length >= 7) do
      if is_full_result do
        values = get_dimensions(ra1, ra2, :full)
        IO.puts "A = #{Map.get values, :A}"
        IO.puts "B = #{Map.get values, :B}"
        IO.puts "D = #{Map.get values, :D}"
        IO.puts "E = #{Map.get values, :E}"
        IO.puts "F = #{Map.get values, :F}"
        IO.puts "G = #{Map.get values, :G}"
        IO.puts "H = #{Map.get values, :H}"
      else
        get_dimensions(ra1, ra2) |> Enum.with_index(fn element, index -> IO.inspect(element, label: "d#{index}") end)
      end

    else
      IO.puts "O número precisa ter mais de 7 digitos"
    end
  end

  defp get_dimensions(ra1, ra2, :full) do
    [d0, d1, d2, d3, d4, d5, d6] = get_dimensions(ra1, ra2)

    valA = 10 + d0
    valB = 5 * (5+(rem(d1, 4)))
    valD = 5 * (5+(rem(d2, 4)))
    valE = div(valD, 2) + rem(d3, 5)
    valF = div(valB, 2) + rem(d4, 5)
    valG = valA + d5
    valH = 10 + d6

    %{ A: valA, B: valB, D: valD, E: valE, F: valF, G: valG, H: valH }
  end

  defp get_dimensions(ra1, ra2) do
    dimensions = for n <- 0..6, do: calculate_dimension_by_student_registers(n, ra1, ra2)
    dimensions
  end
end

CLI.call()
