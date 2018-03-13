module View.Header exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


type alias Config msg =
    { onRefresh : msg
    }


view : Config msg -> Html msg
view config =
    section [ class "hero is-primary" ]
        [ div
            [ class "hero-body" ]
            [ imgLogo, title, refreshBtn config.onRefresh ]
        ]


imgLogo : Html msg
imgLogo =
    img [ class "logo", src "/logo.svg" ] []


title : Html msg
title =
    h5
        [ class "is-uppercase has-text-weight-bold" ]
        [ text "User List" ]


refreshBtn : msg -> Html msg
refreshBtn msg =
    button
        [ class "button is-rounded is-info is-small"
        , onClick msg
        ]
        [ span [ class "icon" ]
            [ i [ class "icon is-small fa fa-refresh" ] []
            ]
        , span []
            [ text "Refresh"
            ]
        ]
