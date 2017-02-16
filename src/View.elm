module View exposing (..)

import Html exposing (..)
import Models exposing (Model, Forecast, DataPoint, Location)
import Messages exposing (Msg(..))


locationView : Location -> Html Msg
locationView ( latitude, longitude ) =
    div [] []


tempView : Forecast -> Html Msg
tempView forecast =
    let
        currently =
            forecast.currently
    in
        div []
            [ h2 [] [ text currently.summary ]
            , case currently.temperature of
                Just t ->
                    div [] [ text (toString t) ]

                Nothing ->
                    div [] []
            ]


view : Model -> Html Msg
view model =
    let
        forecast =
            model.forecast
    in
        case forecast of
            Just forecast ->
                div []
                    [ tempView forecast
                    ]

            Nothing ->
                div [] []
