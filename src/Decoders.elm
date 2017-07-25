module Decoders exposing (..)

import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Types exposing (..)


{-
   I'm expecting something like this:

   {
      "meta":{
         "total-pages":1,
         "total-entries":3,
         "page-size":8,
         "page-number":1
      },
      "data":[
         {
           "id":"1",
            "type":"country",
            "attributes":{
               "name":"Costa Rica",
               "updated-at":"2017-07-12T01:34:40.153411Z",
               "inserted-at":"2017-07-12T01:34:40.13097Z"
            }
         },
         {
           "id":"2",
            "type":"country",
            "attributes":{
               "name":"Panamá",
               "updated-at":"2017-07-13T04:14:33.037904Z",
               "inserted-at":"2017-07-13T04:14:33.023023Z"
            }
         },
         {
           "id":"3",
            "type":"country",
            "attributes":{
               "name":"USA",
               "updated-at":"2017-07-20T00:50:04.165503Z",
               "inserted-at":"2017-07-20T00:50:04.165488Z"
            }
         }
      ]
   }
-}


paginationDecoder : Decoder Pagination
paginationDecoder =
    decode Pagination
        |> required "page-number" Json.Decode.int
        |> required "page-size" Json.Decode.int
        |> required "total-entries" Json.Decode.int
        |> required "total-pages" Json.Decode.int


{-| Decodes a JSONAPI collection.

NOTE: This function does not decode links but you should be able to add the code
to so easily ;)

-}
countryCollectionDecoder : Decoder CountryCollection
countryCollectionDecoder =
    decode CountryCollection
        |> required "meta" paginationDecoder
        |> required "data" (Json.Decode.list countryDecoder)


countryDecoder : Decoder Country
countryDecoder =
    decode Country
        |> required "id" Json.Decode.string
        |> requiredAt [ "attributes", "name" ] Json.Decode.string
        |> requiredAt [ "attributes", "inserted-at" ] Json.Decode.string
        |> requiredAt [ "attributes", "updated-at" ] Json.Decode.string
