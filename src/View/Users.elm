module View.Users exposing (..)

import Data.User as User exposing (User, Users)
import Html exposing (..)
import Html.Attributes exposing (..)


view : Users -> String -> Html msg
view users alert =
    vUsers users alert |> vContainer


vUsers : Users -> String -> Html msg
vUsers users alert =
    let
        isEmpty =
            List.isEmpty users
    in
    if isEmpty then
        alert |> vAlert
    else
        users |> List.map vUser |> ol []


vContainer : Html msg -> Html msg
vContainer data =
    div [ class "min-list-size" ] [ data ]


vAlert : String -> Html msg
vAlert alert =
    div [ class "container has-text-centered is-centered" ]
        [ article [ class "message is-warning " ]
            [ div [ class "message-body" ] [ text alert ] ]
        ]


vUser : User -> Html msg
vUser user =
    li []
        [ text <| User.fullName user
        ]
