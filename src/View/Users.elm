module View.Users exposing (..)

import Data.Picture as Picture
import Data.User as User exposing (User, Users)
import Html exposing (..)
import Html.Attributes exposing (..)


type alias Config =
    { users : Users
    , alert : String
    }


view : Config -> Html msg
view config =
    vUsers config |> vContainer


vUsers : Config -> Html msg
vUsers config =
    let
        showAlert =
            List.isEmpty config.users
    in
    if showAlert then
        vAlert config.alert
    else
        config.users
            |> List.map vUser
            |> div [ class "columns is-multiline is-gapless" ]


vContainer : Html msg -> Html msg
vContainer data =
    div [ class "container min-list-size mt-4 mb-4" ] [ data ]


vAlert : String -> Html msg
vAlert alert =
    div [ class "container has-text-centered is-centered" ]
        [ article [ class "message is-warning " ]
            [ div [ class "message-body" ] [ text alert ] ]
        ]


vUser : User -> Html msg
vUser user =
    div [ class "column is-full-mobile is-half-tablet is-one-quarter-desktop" ]
        [ div
            [ class "card" ]
            [ vCardImage user
            , div
                [ class "card-content" ]
                [ vCardMedia user
                , vCardContent user
                ]
            ]
        ]


vCardImage : User -> Html msg
vCardImage user =
    div [ class "card-image has-text-centered p-1" ]
        [ figure [ class "avatar image is-128x128 is-rounded is-centered" ]
            [ img
                [ alt <| User.fullName user
                , Picture.src user.picture.large
                ]
                []
            ]
        ]


vCardMedia : User -> Html msg
vCardMedia user =
    div [ class "media" ]
        [ div
            [ class "media-content has-text-centered" ]
            [ p [ class "title is-4 is-capitalized text-ellipsis" ]
                [ text <| User.fullName user ]
            , p [ class "subtitle is-6" ]
                [ text user.email ]
            ]
        ]


vCardContent : User -> Html msg
vCardContent user =
    div [ class "content has-text-grey" ]
        [ i [ class "fa fa-phone mr-2" ] []
        , text user.phone
        ]
