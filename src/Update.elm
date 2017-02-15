module Update exposing (..)

import Messages exposing (..)
import Models exposing (..)


-- import Debug


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case Debug.log "MSG: " message of
        NoOp ->
            ( model, Cmd.none )

        FetchAll (Ok data) ->
            ( { model | forecast = Just data }, Cmd.none )

        FetchAll (Err error) ->
            ( model, Cmd.none )
