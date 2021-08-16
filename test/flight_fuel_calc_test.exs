defmodule FlightFuelCalcTest do
  use ExUnit.Case
  doctest FlightFuelCalc

  test "Apollo Calculate" do
    assert FlightFuelCalc.calculate(28801, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]]) == 36778
  end

  test "Apollo Launching" do
    assert FlightFuelCalc.calc_iter_launch(28801, 9.807) == 19772
  end

  test "Apollo Landing" do
    assert FlightFuelCalc.calc_iter_land(28801, 9.807) == 13447
  end

end
