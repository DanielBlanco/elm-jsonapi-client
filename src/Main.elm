module Main exposing (..)

import Api
import Html exposing (Html, div, img, li, ol, text)
import Html.Attributes exposing (src)
import Msg exposing (Msg(..))
import Types exposing (..)


---- MODEL ----


type alias Model =
    { countries : CountryCollection }


initialPagination : Pagination
initialPagination =
    { pageNumber = 1
    , pageSize = 5
    , totalEntries = 0
    , totalPages = 1
    }


initialCountryCollection : CountryCollection
initialCountryCollection =
    { meta = initialPagination, data = [ { id = "1", name = "test", insertedAt = "x", updatedAt = "" } ] }


init : ( Model, Cmd Msg )
init =
    update GetCountryCollection { countries = initialCountryCollection }



--( { countries = initialCountryCollection }, Cmd.none )
---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetCountryCollection ->
            ( model, Api.getCountryCollection )

        UpdateCountryCollection (Ok collection) ->
            { model | countries = collection } ! []

        UpdateCountryCollection (Err error) ->
            Debug.log ("Oops!" ++ toString error) ( model, Cmd.none )

        NoOp ->
            ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ img [ src "/logo.svg" ] []
        , div []
            [ text "Country List"
            , ol [] (viewCountries model)
            ]
        ]


viewCountries : Model -> List (Html Msg)
viewCountries model =
    model.countries.data
        |> List.map viewCountry


viewCountry : Country -> Html Msg
viewCountry country =
    li []
        [ text country.name
        , text (" (" ++ country.insertedAt ++ ")")
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
