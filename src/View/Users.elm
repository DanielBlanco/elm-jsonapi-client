module View.Users exposing (..)

import Data.User as User exposing (User, Users)
import Html exposing (..)


view : Users -> Html msg
view users =
    div []
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
