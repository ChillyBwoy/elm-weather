module Update exposing (..)

import Messages exposing (..)
import Models exposing (..)
import Actions exposing (fetchAll)


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case Debug.log "MSG" message of
        -- case message of
        Idle ->
            ( model, Cmd.none )

        UpdateForecast ->
            ( model, fetchAll model.lang model.location )

        FetchForecast (Ok data) ->
            ( { model | forecast = Just data }, Cmd.none )

        FetchForecast (Err error) ->
            ( model, Cmd.none )

        ChangeLocation value ->
            ( model, Cmd.none )

        ChangeLang value ->
            ( model, Cmd.none )
