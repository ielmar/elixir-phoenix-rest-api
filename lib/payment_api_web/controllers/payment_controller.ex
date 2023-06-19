defmodule PaymentApiWeb.PaymentController do
  use PaymentApiWeb, :controller

  def create(conn, %{"payload" => payload, "code" => code, "message" => message, "route" => route}) do
    [version, orderID, sessionId, transactionType] = Map.values(payload)
    conn
    |> text("POST request successful. Data sent was: #{payload}, #{code}, #{message}, #{route}, #{version}, #{orderID}, #{sessionId}, #{transactionType}, #{payload}")
  end
end
