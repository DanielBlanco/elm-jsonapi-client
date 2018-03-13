module Main exposing (..)

import Data.User as User exposing (User, Users)
import Html exposing (Html, div)
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
    { users : Users
    , error : String
    }


init : ( Model, Cmd Msg )
init =
    update GetUsers { users = [], error = defaultError }


defaultError : String
defaultError =
    "No data to show"



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
            let
                newModel =
                    { model | error = "Error retrieving data!" }
            in
            Debug.log ("Oops!" ++ model.error) ( newModel, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ View.Header.view { onRefresh = GetUsers }
        , View.Users.view model.users model.error
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
