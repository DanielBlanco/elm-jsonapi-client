module Main exposing (..)

import Data.User as User exposing (User, Users)
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Http
import Request.User exposing (UsersResult)
import View.Footer exposing (view)
import View.Header exposing (view)
import View.Users exposing (view)


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
        [ View.Header.view { onRefresh = GetUsers }
        , View.Users.view model.users
        , View.Footer.view
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
