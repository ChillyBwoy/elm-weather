module Models exposing (..)


type Lang
    = Ru
    | En
    | Es


langToString : Lang -> String
langToString lang =
    case lang of
        Ru ->
            "ru"

        En ->
            "en"

        Es ->
            "es"


type alias DataPoint =
    { icon : String
    , time : Int
    , summary : String
    , temperature : Float
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
    }


initModel : Model
initModel =
    { forecast = Nothing
    }
