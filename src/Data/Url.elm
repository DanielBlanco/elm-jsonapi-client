module Data.URL exposing (URL, decoder, default, toMaybeString)

import Json.Decode as Decode exposing (Decoder)


type URL
    = URL (Maybe String)


{-| URL defaults to Nothing.
-}
default : URL
default =
    URL Nothing


{-| Returns the Maybe String.
-}
toMaybeString : URL -> Maybe String
toMaybeString (URL maybeUrl) =
    maybeUrl


{-| Decodes an URL
-}
decoder : Decoder URL
decoder =
    Decode.map URL (Decode.nullable Decode.string)
