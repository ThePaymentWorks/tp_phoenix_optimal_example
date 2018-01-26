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
          uri: "https://tp-phoenix-optimal.herokuapp.com/successRedirect"
        },
        %{
          rel: "on_error",
          returnKeys: [
            "transaction.status",
            "transaction.errorCode",
            "transaction.errorMessage"
          ],
          uri: "https://tp-phoenix-optimal.herokuapp.com/errorRedirect"
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
          uri: "https://tp-phoenix-optimal.herokuapp.com/successCallback"
        },
        %{
          format: "get",
          rel: "on_decline",
          returnKeys: [
            "transaction.status",
            "transaction.errorCode",
            "transaction.errorMessage"
          ],
          uri: "https://tp-phoenix-optimal.herokuapp.com/errorCallback"
        }
      ]
end
