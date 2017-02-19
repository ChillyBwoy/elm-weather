module Models exposing (..)


type Lang
    = Ru
    | En
    | Es


type alias Coords =
    ( Float, Float )


type alias Location =
    { coords : Coords
    , city : String
    }


type alias DataPoint =
    { icon : String
    , time : Int
    , summary : String
    , temperature : Maybe Float
    , temperatureMax : Maybe Float
    , temperatureMin : Maybe Float
    }


type alias DataBlock =
    { icon : String
    , summary : String
    , data : List DataPoint
    }


type alias Forecast =
    { daily : DataBlock
    , hourly : DataBlock
    , currently : DataPoint
    , timezone : String
    , latitude : Float
    , longitude : Float
    }


type alias Model =
    { forecast : Maybe Forecast
    , location : Location
    , lang : Lang
    }


coordsToString : Coords -> String
coordsToString ( latitude, longitude ) =
    toString latitude ++ "," ++ toString longitude


langToString : Lang -> String
langToString lang =
    case lang of
        Ru ->
            "ru"

        En ->
            "en"

        Es ->
            "es"


initModel : Model
initModel =
    { forecast = Nothing
    , lang = Ru
    , location =
        { coords = ( 55.7558, 37.6173 )
        , city = "Moscow"
        }
    }
