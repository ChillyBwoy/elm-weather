module Actions exposing (..)

import Http
import Models exposing (..)
import Messages exposing (..)
import Json.Decode as Decode


darkSkyVerySecretKey : String
darkSkyVerySecretKey =
    "43fcd9de44b4f0ba861d03d7103e2f72"


fetchAll : Cmd Msg
fetchAll =
    Http.get "http://localhost:8000/data.json" decodeResponse
        |> Http.send FetchAll


decodeResponse : Decode.Decoder Model
decodeResponse =
    Decode.map Model
        (Decode.field "timezone" Decode.string)



-- https://api.darksky.net/forecast/43fcd9de44b4f0ba861d03d7103e2f72/55.7558,37.6173?lang=ru
