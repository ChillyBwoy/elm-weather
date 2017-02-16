module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Models exposing (Model, Forecast, DataPoint, Location)
import Messages exposing (Msg(..))


locationView : Location -> Html Msg
locationView ( latitude, longitude ) =
    div []
        [ div []
            [ input [ placeholder "latitude", onInput (ChangeLocation), value (toString latitude) ] []
            ]
        , div []
            [ input [ placeholder "longitude", onInput (ChangeLocation), value (toString longitude) ] []
            ]
        ]


dataPointView : DataPoint -> Html Msg
dataPointView data =
    li []
        [ div []
            [ text data.summary
            ]
        , div []
            [ case data.temperatureMin of
                Just t ->
                    span [] [ text (toString t) ]

                Nothing ->
                    text ""
            , case data.temperature of
                Just t ->
                    span [] [ text (toString t) ]

                Nothing ->
                    text ""
            , case data.temperatureMax of
                Just t ->
                    span [] [ text (toString t) ]

                Nothing ->
                    text ""
            ]
        ]


dataPointListView : List DataPoint -> Html Msg
dataPointListView dataList =
    ul [] (List.map dataPointView dataList)


mainView : Forecast -> Html Msg
mainView forecast =
    let
        currently =
            forecast.currently

        hourly =
            forecast.hourly

        daily =
            forecast.daily
    in
        div []
            [ h2 [] [ text currently.summary ]
            , locationView ( forecast.latitude, forecast.longitude )
            , case currently.temperature of
                Just t ->
                    div [] [ text (toString t) ]

                Nothing ->
                    text ""
            , dataPointListView hourly.data
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
                    [ mainView forecast
                    ]

            Nothing ->
                text ""
