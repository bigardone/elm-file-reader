module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on)
import Json.Decode as JD
import Messages exposing (Msg(..))
import Model exposing (Model, ImageData(..))


view : Model -> Html Msg
view model =
    section
        [ sectionStyles ]
        [ imageView model.imageData
        , input
            [ type_ "file"
            , accept "image/*"
            , on "change" <| JD.map FileSelected JD.value
            ]
            []
        ]


sectionStyles : Html.Attribute Msg
sectionStyles =
    style
        [ ( "height", "100vh" )
        , ( "display", "flex" )
        , ( "justify-content", "center" )
        , ( "align-items", "center" )
        , ( "flex-direction", "column" )
        ]


imageView : ImageData String String -> Html Msg
imageView imageData =
    case imageData of
        NotLoaded ->
            p
                []
                [ text "Choose an image file using the selector below..." ]

        Loading ->
            p
                []
                [ text "Loading..." ]

        Error error ->
            p
                []
                [ text error ]

        Success binary ->
            img
                [ style
                    [ ( "max-height", "300px" )
                    , ( "margin-bottom", "3rem" )
                    ]
                , src binary
                ]
                []
