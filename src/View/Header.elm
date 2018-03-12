module View.Header exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)


view : Html msg
view =
    section [ class "hero is-primary" ]
        [ div
            [ class "hero-body" ]
            [ imgLogo, title ]
        ]


imgLogo : Html msg
imgLogo =
    img [ class "logo", src "/logo.svg" ] []


title : Html msg
title =
    h5
        [ class "is-uppercase has-text-weight-bold" ]
        [ text "User List" ]
