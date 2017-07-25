module Msg exposing (..)

import Types exposing (..)


type Msg
    = NoOp
    | GetCountryCollection
    | UpdateCountryCollection CountryCollectionResult
