module Data.User exposing (User, Users, decoder, fullName, listDecoder)

import Data.Picture as Picture exposing (Picture)
import Json.Decode as D exposing (Decoder)
import Json.Decode.Pipeline exposing (..)


type Gender
    = Male
    | Female


type alias Email =
    String


type alias UserID =
    { name : String
    , value : String
    }


type alias Users =
    List User


type alias User =
    { id : UserID
    , title : String
    , firstName : String
    , lastName : String
    , email : Email
    , picture : Picture
    }


{-| Returns this user full name
-}
fullName : User -> String
fullName user =
    user.title ++ " " ++ user.firstName ++ " " ++ user.lastName



---- DECODERS ----


listDecoder : Decoder Users
listDecoder =
    D.at [ "results" ] (D.list decoder)


decoder : Decoder User
decoder =
    decode User
        |> required "id" idDecoder
        |> requiredAt [ "name", "title" ] D.string
        |> requiredAt [ "name", "first" ] D.string
        |> requiredAt [ "name", "last" ] D.string
        |> required "email" D.string
        |> required "picture" Picture.decoder


idDecoder : Decoder UserID
idDecoder =
    decode UserID
        |> required "name" D.string
        |> required "value" D.string
