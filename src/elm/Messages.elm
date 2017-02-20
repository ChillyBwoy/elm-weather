module Messages exposing (..)

import Http
import Models exposing (Forecast)


type Msg
    = Idle
    | UpdateForecast
    | FetchForecast (Result Http.Error Forecast)
    | ChangeLocation String
    | ChangeLang String
