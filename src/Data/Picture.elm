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


{-| Default Picture record.
-}
default : Picture
default =
    { large = URL.default
    , medium = URL.default
    , thumbnail = URL.default
    }


{-| Returns a HTML src attribute to be used in <img> element.
-}
src : URL -> Attribute msg
src =
    toStringUrl >> Html.Attributes.src


{-| Returns a String URL
-}
toStringUrl : URL -> String
toStringUrl url =
    let
        maybeString =
            URL.toMaybeString url
    in
    case maybeString of
        Nothing ->
            "https://s3-us-west-2.amazonaws.com/cdn.danielblancorojas.com/images/ghost.svg"

        Just url ->
            url


{-| Decodes a picture.
-}
decoder : Decoder Picture
decoder =
    decode Picture
        |> required "large" URL.decoder
        |> required "medium" URL.decoder
        |> required "thumbnail" URL.decoder
