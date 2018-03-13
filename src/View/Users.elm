module View.Users exposing (..)

import Data.User as User exposing (User, Users)
import Html exposing (..)
import Html.Attributes exposing (..)


view : Users -> Html msg
view users =
    let
        isEmpty =
            List.isEmpty users
    in
    if isEmpty then
        vEmptyMessage |> vContainer
    else
        users
            |> List.map vUser
            |> ol []
            |> vContainer


vContainer : Html msg -> Html msg
vContainer data =
    div [ class "min-list-size" ] [ data ]


vEmptyMessage : Html msg
vEmptyMessage =
    div [ class "container has-text-centered is-centered" ]
        [ article [ class "message is-warning " ]
            [ div [ class "message-body" ] [ text "No data to show" ] ]
        ]


vUser : User -> Html msg
vUser user =
    li []
        [ text <| User.fullName user
        ]
