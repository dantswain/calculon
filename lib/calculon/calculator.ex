defmodule Calculon.Calculator do
  def eval(string) do
    ast = Code.string_to_quoted!(string)
    if is_simple_arithmetic?(ast) do
      {result, []} = Code.eval_quoted(ast)
      result
    else
      nil
    end
  end

  def is_simple_arithmetic?({op, _, args}) do
    Enum.member?([:+, :-, :*, :/], op) && bare_args?(args) 
  end
  def is_simple_arithmetic?(_) do
  end

  def bare_args?([arg1, arg2]) when is_number(arg1) and is_number(arg2) do
    true
  end
  def bare_args?(_) do
    false
  end
end
