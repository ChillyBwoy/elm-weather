module Actions exposing (..)

import Http
import Messages exposing (..)
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


apiUrl : String
apiUrl =
    "https://api.darksky.net/forecast/"
        ++ darkSkyVerySecretKey
        ++ "/55.7558,37.6173/?"
        ++ queryArgs [ ( "lang", "ru" ), ( "units", "si" ) ]


fetchAll : Cmd Msg
fetchAll =
    Http.get apiUrl decodeForecast
        |> Http.send FetchAll
