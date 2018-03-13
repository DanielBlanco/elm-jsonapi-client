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
        users |> List.map vUser |> div [ class "columns is-multiline is-mobile" ]


vContainer : Html msg -> Html msg
vContainer data =
    div [ class "container min-list-size" ] [ data ]


vAlert : String -> Html msg
vAlert alert =
    div [ class "container has-text-centered is-centered" ]
        [ article [ class "message is-warning " ]
            [ div [ class "message-body" ] [ text alert ] ]
        ]


vUser : User -> Html msg
vUser user =
    div [ class "column is-full-mobile is-half-tablet is-one-quarter-desktop" ]
        [ div [ class "card" ]
            [ div [ class "card-image" ]
                [ figure [ class "image is-4by3" ]
                    [ img [ alt "Placeholder image", src "https://bulma.io/images/placeholders/1280x960.png" ]
                        []
                    ]
                ]
            , div [ class "card-content" ]
                [ div [ class "media" ]
                    [ div [ class "media-left" ]
                        [ figure [ class "image is-48x48" ]
                            [ img [ alt "Placeholder image", src "https://bulma.io/images/placeholders/96x96.png" ]
                                []
                            ]
                        ]
                    , div [ class "media-content" ]
                        [ p [ class "title is-4" ]
                            [ text "John Smith" ]
                        , p [ class "subtitle is-6" ]
                            [ text "@johnsmith" ]
                        ]
                    ]
                , div [ class "content" ]
                    [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit.      Phasellus nec iaculis mauris. "
                    , a []
                        [ text "@bulmaio" ]
                    , text ".      "
                    , a [ href "#" ]
                        [ text "#css" ]
                    , a [ href "#" ]
                        [ text "#responsive" ]
                    , br []
                        []
                    , time [ datetime "2016-1-1" ]
                        [ text "11:09 PM - 1 Jan 2016" ]
                    ]
                ]
            ]
        ]
