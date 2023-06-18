defmodule PaymentApiWeb.PaymentController do
  use PaymentApiWeb, :controller

  def create(conn, %{"payment" => payment_params}) do
    [age, name] = Map.values(payment_params)
    conn
    |> text("POST request successful. Data sent was: #{name}, #{age}")
  end
end
