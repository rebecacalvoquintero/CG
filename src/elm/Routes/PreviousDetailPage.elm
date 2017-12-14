module Routes.PreviousDetailPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


previousDetailPage : Model -> Html Msg
previousDetailPage model =
    let
        interactionTextHtml =
            case model.liveInteraction.notes.text of
                intText ->
                    div
                        [ class "flex v-mid" ]
                        [ p [ class "blue center f5 ma0 pb3" ] [ text intText ]
                        ]

        interactionAudioHtml =
            case model.liveInteraction.notes.audioUrl of
                audioUrl ->
                    audio [ controls True, class " mv3 pa3", id "audio", src audioUrl ] []
    in
        div [ class "interactionDetailsImage w-100 center brand tc" ]
            [ div [ class "w-100 h4 bg-white bb b--black-10 v-mid flex" ]
                [ a [ href "#" ] [ img [ class "pa3 h2", src "./assets/png/icon.png" ] [] ]
                , h2 [ class "blue center pt2" ] [ text model.liveInteraction.name ]
                ]
            , div [ class "w-100 center ma0 pa0" ]
                [ div [ class "inline-flex flex-wrap" ]
                    [ button [ onClick <| PlayAudio True, class "button-transparent" ] [ img [ class "ma3 br-100", src "./assets/svg_icons/hear_rec.svg" ] [ interactionAudioHtml ] ]
                    , img [ class "ma3", src "./assets/svg_icons/man.svg" ] []
                    , button [ class "button-transparent" ] [ img [ class "ma3 br-100", src "./assets/svg_icons/cal.svg" ] [] ]
                    ]
                ]
            , interactionAudioHtml
            , div [ class " w-100" ]
                [ div [ class "bg-blue white pa0 ma0" ]
                    [ h3 [ class "center pt3 underline" ] [ text "Date and time" ]
                    , p [ class "f5" ] [ text "Met on Aug 3rd, 2017 at 6pm" ]
                    , p [ class "f5 ma0 pb3" ] [ text "at New Town Hall, GL8 9JDF" ]
                    ]
                , div [ class "bg-moon-gray blue ma0" ]
                    [ h3 [ class "bold center pt3 mt0" ] [ text "Notes" ]
                    , interactionTextHtml
                    ]
                , div [ class "bg-light-gray blue ma0" ]
                    [ h3 [ class "mt0 pt3" ] [ text "Contact" ]
                    , p [] [ text <| "Email: " ++ model.liveInteraction.email ]
                    , p [ class "pb3 ma0" ] [ text <| "Phone: " ++ model.liveInteraction.phone ]
                    ]
                , div [ class "bg-near-white blue ma0" ] <|
                    [ h3 [ class "mt0 pt3" ] [ text "Actions" ]
                    , p [] [ text "Shared" ]
                    , p [ class "pb3 ma0" ] [ text "Reminders" ]
                    ]
                ]
            , div [ class "bg-white blue ma0" ] <|
                [ h3 [ class "mt0 pt3" ] [ text "Recommendations" ]
                ]
                    ++ List.map recommendItem model.liveInteraction.recommendations
            ]


recommendItem : Recommendation -> Html Msg
recommendItem rec =
    div []
        [ p [] [ text <| "Recommended " ++ rec.name ++ " from " ++ rec.organisation ]
        ]



-- recommendContent :List Recommendation -> List Html Msg
-- recommendContent recommendationList =
--     List.Map  recommendation
