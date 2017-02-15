module Messages exposing (..)

import Http
import Models exposing (Forecast)


type Msg
    = NoOp
    | FetchAll (Result Http.Error Forecast)
