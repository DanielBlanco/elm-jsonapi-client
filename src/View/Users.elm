module View.Users exposing (..)

import Data.User as User exposing (User, Users)
import Html exposing (..)
import Html.Attributes exposing (..)


view : Users -> Html msg
view users =
    div [ class "min-list-size" ]
        [ text "User List"
        , users
            |> List.map vUser
            |> ol []
        ]


vUser : User -> Html msg
vUser user =
    li []
        [ text <| User.fullName user
        ]
