module Msg exposing (..)

import Types exposing (..)


type Msg
    = NoOp
    | GetUsers
    | GotUsers UsersResult
