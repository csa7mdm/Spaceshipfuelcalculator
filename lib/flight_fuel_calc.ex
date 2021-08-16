defmodule FlightFuelCalc do
  @moduledoc """
  Documentation for `FlightFuelCalc`.
  """

  def calculate(ship_mass, directive_gravity_list) do
    Enum.reduce(directive_gravity_list, 0, fn [directive, gravity], acc_fuel -> acc_fuel + fuel_for_single_filight(ship_mass, directive, gravity) end)
  end

  def fuel_for_single_filight(ship_mass, directive, gravity) do
    if directive == :launch do
        fuel_required = calc_iter_launch(ship_mass, gravity)
      else
        fuel_required = calc_iter_land(ship_mass, gravity)
      end
  end

  def calc_iter_launch(mass, gravity)do
    fuel_req = floor((mass * gravity * 0.042 - 33))

    if fuel_req > 0 do
     fuel_req = fuel_req + calc_iter_launch(fuel_req, gravity)
    else
      0
    end
  end

  def calc_iter_land(mass, gravity)do
    fuel_req = floor((mass * gravity * 0.033 - 42))

    if fuel_req > 0 do
     fuel_req = fuel_req + calc_iter_land(fuel_req, gravity)
    else
      0
    end
  end

end
