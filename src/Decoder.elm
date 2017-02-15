module Decoder exposing (..)

import Json.Decode as Decode
import Models exposing (DataPoint, DataBlock, Forecast)


decodeDataPoint : Decode.Decoder DataPoint
decodeDataPoint =
    Decode.map4 DataPoint
        (Decode.field "icon" Decode.string)
        (Decode.field "time" Decode.int)
        (Decode.field "summary" Decode.string)
        (Decode.field "temperature" Decode.float)


decodeDataPointList : Decode.Decoder (List DataPoint)
decodeDataPointList =
    Decode.list decodeDataPoint


decodeDataBlock : Decode.Decoder DataBlock
decodeDataBlock =
    Decode.map3 DataBlock
        (Decode.field "icon" Decode.string)
        (Decode.field "summary" Decode.string)
        (Decode.field "data" decodeDataPointList)


decodeForecast : Decode.Decoder Forecast
decodeForecast =
    Decode.map6 Forecast
        (Decode.field "daily" decodeDataBlock)
        (Decode.field "hourly" decodeDataBlock)
        (Decode.field "currently" decodeDataPoint)
        (Decode.field "timezone" Decode.string)
        (Decode.field "latitude" Decode.float)
        (Decode.field "longitude" Decode.float)
