module Request.User exposing (UsersResult, index)

import Data.User as User exposing (Users)
import Http
import HttpBuilder
import Time


type alias UsersResult =
    Result Http.Error Users


{-| Retrieves a list of users from the API.
-}
index : Http.Request Users
index =
    "https://randomuser.me/api/?results=12"
        |> HttpBuilder.get
        |> HttpBuilder.withHeader "Accept" "application/vnd.api+json"
        |> HttpBuilder.withTimeout (30 * Time.second)
        |> HttpBuilder.withExpect (Http.expectJson User.listDecoder)
        |> HttpBuilder.toRequest
