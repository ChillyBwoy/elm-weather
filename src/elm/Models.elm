module Models exposing (..)


type Lang
    = Ru
    | En
    | Es


type alias Coords =
    ( Float, Float )


type alias City =
    { name : String
    , coords : Coords
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
    , city : City
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
    , city =
        { coords = ( 55.7558, 37.6173 )
        , name = "Moscow"
        }
    }
