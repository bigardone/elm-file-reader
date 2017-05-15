module Main exposing (..)

import Html exposing (Html, program, section, input, text, p)
import Html.Attributes exposing (type_, style, accept)
import Html.Events exposing (on)
import Native.FileReader


-- Model


type alias Model =
    { imageBinary : Maybe String }


initialModel : Model
initialModel =
    { imageBinary = Nothing }



-- Messages


type Msg
    = NoOp



-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []



-- View


view : Model -> Html Msg
view model =
    section
        [ sectionStyles ]
        [ imageView model.imageBinary
        , input
            [ type_ "file"
            , accept "image/*"
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


imageView : Maybe String -> Html Msg
imageView maybeImageBinary =
    case maybeImageBinary of
        Just imageBinary ->
            p
                []
                [ text "Image will be rendered here" ]

        Nothing ->
            p
                []
                [ text "No image selected yet" ]



-- Main


init : ( Model, Cmd Msg )
init =
    initialModel ! []


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
