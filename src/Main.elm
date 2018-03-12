module Main exposing (..)

import Data.User as User exposing (User, Users)
import Html exposing (Html, div, img, li, ol, text)
import Html.Attributes exposing (src)
import Http
import Request.User exposing (UsersResult)
import Types exposing (..)


---- MODEL ----


type Msg
    = NoOp
    | GetUsers
    | GotUsers UsersResult


type alias Model =
    { users : Users }


init : ( Model, Cmd Msg )
init =
    update GetUsers { users = [] }



--( { countries = initialCountryCollection }, Cmd.none )
---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        GetUsers ->
            ( model, Request.User.index |> Http.send GotUsers )

        GotUsers (Ok users) ->
            { model | users = users } ! []

        GotUsers (Err error) ->
            Debug.log ("Oops!" ++ toString error) ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ img [ src "/logo.svg" ] []
        , div []
            [ text "User List"
            , ol [] (viewUsers model.users)
            ]
        ]


viewUsers : Users -> List (Html Msg)
viewUsers users =
    List.map viewUser users


viewUser : User -> Html Msg
viewUser user =
    li []
        [ text <| User.fullName user
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
