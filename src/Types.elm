module Types exposing (..)

import Http


type alias Country =
    { id : String
    , name : String
    , insertedAt : String
    , updatedAt : String
    }


type alias Pagination =
    { pageNumber : Int
    , pageSize : Int
    , totalEntries : Int
    , totalPages : Int
    }


type alias CountryCollection =
    { meta : Pagination
    , data : List Country
    }



-- type alias ApiResult =
--     Result Http.Error JsonApi.Document
