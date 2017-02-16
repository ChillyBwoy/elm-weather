module Models exposing (..)


type Lang
    = Ru
    | En
    | Es


type alias Location =
    ( Float, Float )


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


locationToString : Location -> String
locationToString ( latitude, longitude ) =
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
    , location = ( 55.7558, 37.6173 )
    }
