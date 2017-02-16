module Update exposing (..)

import Messages exposing (..)
import Models exposing (..)


-- import Debug


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    -- case Debug.log "MSG: " message of
    case message of
        NoOp ->
            ( model, Cmd.none )

        UpdateForecast ->
            ( model, Cmd.none )

        FetchForecast (Ok data) ->
            ( { model | forecast = Just data }, Cmd.none )

        FetchForecast (Err error) ->
            ( model, Cmd.none )

        ChangeLocation value ->
            ( model, Cmd.none )
