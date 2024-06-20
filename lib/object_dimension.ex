defmodule ObjectDimension do
  @moduledoc """
  Documentation for `Ra`.
  """

  @spec calculate_dimension_by_student_registers(x:: number(), ra1:: number(), ra2:: number()) :: number()
  @doc """
  Calculate object dimension by Student Registers 1 and 2.

  ## Examples

      iex> Ra.calculate_dimension_by_student_registers(0, 25, 36)
      1

  """
  def calculate_dimension_by_student_registers(x, ra1, ra2) do
    a = ra1 |> Integer.digits |> Enum.at(ra1 |> Integer.digits |> length |> Kernel.-(1) |> Kernel.-(x))
    b = ra2 |> Integer.digits |> Enum.at(ra2 |> Integer.digits |> length |> Kernel.-(1) |> Kernel.-(x))

    a + b
    |> Kernel.rem(10)
  end
end
