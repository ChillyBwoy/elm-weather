module View exposing (..)

import Html exposing (..)
import Models exposing (Model, DataPoint)
import Messages exposing (Msg(..))


tempView : DataPoint -> Html Msg
tempView data =
    div [] [ text data.summary ]


view : Model -> Html Msg
view model =
    let
        forecast =
            model.forecast
    in
        case forecast of
            Just forecast ->
                div []
                    [ tempView forecast.currently
                    ]

            Nothing ->
                div [] [ text "no data" ]
