module Main exposing (..)

import Html exposing (..)
import Native.FileReader


main : Html msg
main =
    let
        test =
            Native.FileReader.test ()
    in
        text test
