module Messages exposing (..)

import Http
import Models exposing (Model)


type Msg
    = NoOp
    | FetchAll (Result Http.Error Model)
