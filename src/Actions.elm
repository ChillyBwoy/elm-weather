module Actions exposing (..)

import Http
import Messages exposing (..)
import Models exposing (Lang, Location, langToString, locationToString)
import Decoder exposing (forecast)


queryPair : ( String, String ) -> String
queryPair ( left, right ) =
    left ++ "=" ++ right


queryArgs : List ( String, String ) -> String
queryArgs args =
    String.join "&" (List.map queryPair args)


apiUrl : Lang -> Location -> String
apiUrl lang location =
    let
        args =
            queryArgs
                [ ( "lang", langToString lang )
                , ( "units", "si" )
                ]
    in
        "http://localhost:8001/api/"
            ++ locationToString location
            ++ "/?"
            ++ args


fetchAll : Lang -> Location -> Cmd Msg
fetchAll lang location =
    Http.send FetchForecast <|
        Http.get (apiUrl lang location) forecast
