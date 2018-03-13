module Main exposing (..)

import Data.User as User exposing (User, Users)
import Html exposing (Html, div)
import Http
import Request.User exposing (UsersResult)
import View.Footer exposing (view)
import View.Header exposing (view)
import View.Users exposing (view)


---- MODEL ----


type alias Flags =
    { imgLogo : String
    }


type Msg
    = NoOp
    | GetUsers
    | GotUsers UsersResult


type alias Model =
    { flags : Flags
    , users : Users
    , error : String
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    update GetUsers { flags = flags, users = [], error = defaultError }


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
                    { model | error = "Error retrieving data!", users = [] }
            in
            Debug.log ("Oops!" ++ model.error) ( newModel, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ View.Header.view
            { onRefresh = GetUsers
            , imgLogo = model.flags.imgLogo
            }
        , View.Users.view
            { users = model.users
            , alert = model.error
            }
        , View.Footer.view
        ]



---- PROGRAM ----


main : Program Flags Model Msg
main =
    Html.programWithFlags
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
