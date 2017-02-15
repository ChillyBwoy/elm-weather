module Actions exposing (..)

import Http
import Messages exposing (..)
import Models exposing (Lang, langToString)


-- import Models exposing (Forecast)

import Decoder exposing (decodeForecast)


darkSkyVerySecretKey : String
darkSkyVerySecretKey =
    "43fcd9de44b4f0ba861d03d7103e2f72"


queryPair : ( String, String ) -> String
queryPair ( left, right ) =
    left ++ "=" ++ right


queryArgs : List ( String, String ) -> String
queryArgs args =
    String.join "&" (List.map queryPair args)


apiUrl : Lang -> String
apiUrl lang =
    "http://localhost:8001/api/forecast/"
        ++ darkSkyVerySecretKey
        ++ "/55.7558,37.6173/?"
        ++ queryArgs [ ( "lang", langToString lang ), ( "units", "si" ) ]


fetchAll : Cmd Msg
fetchAll =
    Http.send FetchForecast <|
        Http.get (apiUrl Models.Ru) decodeForecast
