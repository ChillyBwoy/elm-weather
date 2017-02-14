module Decoder exposing (..)

import Json.Decode as Decode
import Models exposing (..)


decodeDataPoint : Decode.Decoder DataPoint
decodeDataPoint =
    Decode.map4 DataPoint
        (Decode.field "icon" Decode.string)
        (Decode.field "time" Decode.int)
        (Decode.field "summary" Decode.string)
        (Decode.field "temperature" Decode.float)
