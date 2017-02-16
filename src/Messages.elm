module Messages exposing (..)

import Http
import Models exposing (Forecast, Location)


type Msg
    = NoOp
    | UpdateForecast
    | FetchForecast (Result Http.Error Forecast)
    | ChangeLocation String
