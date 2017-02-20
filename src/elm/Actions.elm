module Actions exposing (..)

import Http
import Messages exposing (..)
import Models exposing (Lang, Coords, langToString, coordsToString)
import Decoder exposing (forecast)


queryPair : ( String, String ) -> String
queryPair ( left, right ) =
    left ++ "=" ++ right


queryArgs : List ( String, String ) -> String
queryArgs args =
    String.join "&" (List.map queryPair args)


apiUrl : Lang -> Coords -> String
apiUrl lang coords =
    let
        args =
            queryArgs
                [ ( "lang", langToString lang )
                , ( "units", "si" )
                ]
    in
        "http://localhost:8001/api/"
            ++ coordsToString coords
            ++ "/?"
            ++ args


fetchAll : Lang -> Coords -> Cmd Msg
fetchAll lang coords =
    Http.get (apiUrl lang coords) forecast
        |> Http.send FetchForecast
