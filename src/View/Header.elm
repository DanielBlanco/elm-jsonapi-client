module View.Header exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


type alias Config msg =
    { onRefresh : msg
    , imgLogo : String
    }


view : Config msg -> Html msg
view config =
    section [ class "hero is-primary" ]
        [ div
            [ class "hero-body" ]
            [ imgLogo config.imgLogo, title, refreshBtn config.onRefresh ]
        ]


imgLogo : String -> Html msg
imgLogo path =
    img [ class "logo", src path ] []


title : Html msg
title =
    h5
        [ class "is-uppercase has-text-weight-bold" ]
        [ text "User List from https://randomuser.me" ]


refreshBtn : msg -> Html msg
refreshBtn msg =
    button
        [ class "button is-rounded is-info is-small mt-2"
        , onClick msg
        ]
        [ span [ class "icon" ]
            [ i [ class "icon is-small fa fa-refresh" ] []
            ]
        , span []
            [ text "Refresh"
            ]
        ]
