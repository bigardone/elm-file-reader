module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on)
import Json.Decode as JD
import Native.FileReader
import Task exposing (attempt)


-- Model


type ImageData e s
    = NotLoaded
    | Loading
    | Error e
    | Success s


type alias Model =
    { imageData : ImageData String String }


initialModel : Model
initialModel =
    { imageData = NotLoaded }



-- Messages


type Msg
    = FileSelected JD.Value
    | FileLoaded (Result String String)



-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FileSelected event ->
            { model | imageData = Loading } ! [ loadFile event ]

        FileLoaded (Ok binary) ->
            { model | imageData = Success binary } ! []

        FileLoaded (Err error) ->
            { model | imageData = Error error } ! []


loadFile : JD.Value -> Cmd Msg
loadFile =
    Native.FileReader.readFile >> attempt FileLoaded



-- View


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
