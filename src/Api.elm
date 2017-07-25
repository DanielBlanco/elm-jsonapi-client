module Api exposing (..)

import Decoders exposing (..)
import Http exposing (..)
import Msg exposing (Msg(..))
import Types exposing (..)


getCountryCollection : Cmd Msg
getCountryCollection =
    let
        url =
            "http://localhost:4000/api/territories"
    in
    Http.send UpdateCountryCollection
        (Http.get url Decoders.countryCollectionDecoder)
