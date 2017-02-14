module Models exposing (..)


type Lang
    = Ru
    | En
    | Es


type alias DataPoint =
    { icon : String
    , time : Int
    , summary : String
    , temperature : Float
    }


type alias Forecast =
    { icon : String
    , summary : String
    , data : List DataPoint
    }


type alias Model =
    { lang : Lang
    }
