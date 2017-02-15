module Messages exposing (..)

import Http
import Models exposing (Forecast)


type Msg
    = NoOp
    | UpdateForecast
    | FetchForecast (Result Http.Error Forecast)
