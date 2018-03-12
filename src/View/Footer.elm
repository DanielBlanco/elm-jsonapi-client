module View.Footer exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)


view : Html msg
view =
    footer [ class "footer" ]
        [ div [ class "container" ]
            [ div [ class "content has-text-centered" ]
                [ p []
                    [ strong []
                        [ text "ELM Client" ]
                    , text " by "
                    , a [ href "https://twitter.com/dblancorojas" ]
                        [ text "Daniel Blanco" ]
                    , text ". The source code can be found "
                    , a [ href "https://github.com/DanielBlanco/elm-jsonapi-client" ]
                        [ text "here" ]
                    , text "."
                    ]
                ]
            ]
        ]
