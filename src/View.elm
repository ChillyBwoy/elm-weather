module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Models exposing (Model, Lang, Forecast, DataPoint, Coords, langToString)
import Messages exposing (Msg(..))


langView : List Lang -> Lang -> Html Msg
langView langList current =
    div []
        [ select [ onInput ChangeLang ]
            (List.map (\l -> option [ selected (l == current) ] [ text (langToString l) ]) langList)
        ]


coordsView : Coords -> Html Msg
coordsView ( latitude, longitude ) =
    div []
        [ div []
            [ input
                [ placeholder "latitude"
                , onInput (ChangeLocation)
                , value (toString latitude)
                ]
                []
            ]
        , div []
            [ input
                [ placeholder "longitude"
                , onInput (ChangeLocation)
                , value (toString longitude)
                ]
                []
            ]
        ]


dataPointView : DataPoint -> Html Msg
dataPointView data =
    let
        spanWrap el =
            case el of
                Just x ->
                    span [] [ text (toString x) ]

                Nothing ->
                    text ""
    in
        div []
            [ span [] [ text data.icon ]
            , spanWrap data.temperatureMin
            , spanWrap data.temperature
            , spanWrap data.temperatureMax
            ]


dataPointListView : String -> List DataPoint -> Html Msg
dataPointListView label dataList =
    div []
        [ h3 [] [ text label ]
        , ul [] (List.map (\x -> dataPointView x) dataList)
        ]


forecastView : Forecast -> Html Msg
forecastView forecast =
    let
        currently =
            forecast.currently

        hourly =
            forecast.hourly

        daily =
            forecast.daily
    in
        div []
            [ dataPointView currently
            , dataPointListView "Hourly" hourly.data
            , dataPointListView "Daily" daily.data
            ]


view : Model -> Html Msg
view model =
    let
        langList =
            [ Models.Ru, Models.En, Models.Es ]
    in
        div []
            [ langView langList model.lang
            , coordsView model.location.coords
            , case model.forecast of
                Just x ->
                    div [] [ forecastView x ]

                Nothing ->
                    text ""
            ]
