defmodule TpPhoenixOptimalExample.Optimal.SuccessOrder do
  defstruct totalAmount: "100",
      merchantRefNum: "abc123",
      currencyCode: "EUR",
      redirect: [
        %{
          rel: "on_success",
          returnKeys: [
            "transaction.status",
            "transaction.errorCode",
            "transaction.errorMessage"
          ],
          uri: "http://localhost:4000/successRedirect"
        },
        %{
          rel: "on_error",
          returnKeys: [
            "transaction.status",
            "transaction.errorCode",
            "transaction.errorMessage"
          ],
          uri: "http://localhost:4000/errorRedirect"
        }
      ],
      callback: [
        %{
          format: "get",
          rel: "on_success",
          returnKeys: [
            "transaction.status",
            "transaction.errorCode",
            "transaction.errorMessage"
          ],
          uri: "http://localhost:4000/successCallback"
        },
        %{
          format: "get",
          rel: "on_decline",
          returnKeys: [
            "transaction.status",
            "transaction.errorCode",
            "transaction.errorMessage"
          ],
          uri: "http://localhost:4000/errorCallback"
        }
      ]
end
