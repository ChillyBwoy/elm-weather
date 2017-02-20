module Decoder exposing (..)

import Json.Decode as Decode exposing (Decoder, field, int, string, float, maybe)
import Models exposing (DataPoint, DataBlock, Forecast)


dataPoint : Decoder DataPoint
dataPoint =
    Decode.map6 DataPoint
        (field "icon" string)
        (field "time" int)
        (field "summary" string)
        (maybe (field "temperature" float))
        (maybe (field "temperatureMax" float))
        (maybe (field "temperatureMin" float))


dataPointList : Decoder (List DataPoint)
dataPointList =
    Decode.list dataPoint


dataBlock : Decoder DataBlock
dataBlock =
    Decode.map3 DataBlock
        (field "icon" string)
        (field "summary" string)
        (field "data" dataPointList)


forecast : Decoder Forecast
forecast =
    Decode.map6 Forecast
        (field "daily" dataBlock)
        (field "hourly" dataBlock)
        (field "currently" dataPoint)
        (field "timezone" string)
        (field "latitude" float)
        (field "longitude" float)
