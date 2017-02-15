module Decoder exposing (..)

import Json.Decode as Decode exposing (Decoder, field, int, string, float, maybe)
import Models exposing (DataPoint, DataBlock, Forecast)


decodeDataPoint : Decoder DataPoint
decodeDataPoint =
    Decode.map6 DataPoint
        (field "icon" string)
        (field "time" int)
        (field "summary" string)
        (maybe (field "temperature" float))
        (maybe (field "temperatureMax" float))
        (maybe (field "temperatureMin" float))


decodeDataPointList : Decoder (List DataPoint)
decodeDataPointList =
    Decode.list decodeDataPoint


decodeDataBlock : Decoder DataBlock
decodeDataBlock =
    Decode.map3 DataBlock
        (field "icon" string)
        (field "summary" string)
        (field "data" decodeDataPointList)


decodeForecast : Decoder Forecast
decodeForecast =
    Decode.map6 Forecast
        (field "daily" decodeDataBlock)
        (field "hourly" decodeDataBlock)
        (field "currently" decodeDataPoint)
        (field "timezone" string)
        (field "latitude" float)
        (field "longitude" float)
