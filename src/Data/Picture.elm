module Data.Picture exposing (Picture, decoder, default, src)

import Data.URL as URL exposing (URL)
import Html exposing (Attribute)
import Html.Attributes
import Json.Decode as D exposing (Decoder)
import Json.Decode.Pipeline exposing (..)


type alias Picture =
    { large : URL
    , medium : URL
    , thumbnail : URL
    }


src : URL -> Attribute msg
src =
    toUrl >> Html.Attributes.src


{-| -}
default : Picture
default =
    { large = URL.default
    , medium = URL.default
    , thumbnail = URL.default
    }


toUrl : URL -> String
toUrl url =
    let
        maybeString =
            URL.toMaybeString url
    in
    case maybeString of
        Nothing ->
            "/images/ghost.svg"

        Just url ->
            url



-- DECODERS --


{-| Decode.map Picture (Decode.nullable Decode.string)
-}
decoder : Decoder Picture
decoder =
    decode Picture
        |> required "large" URL.decoder
        |> required "medium" URL.decoder
        |> required "thumbnail" URL.decoder



-- maybeBlank : Decoder (Maybe String)
-- maybeBlank =
--     Decode.string
--         |> Decode.andThen (validateString >> fromResult)
--         |> Decode.maybe
