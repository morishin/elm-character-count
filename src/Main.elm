module Main exposing (..)
import Browser exposing (sandbox)
import Html exposing (Html, text, div, textarea)
import Html.Attributes exposing (style, placeholder)
import Html.Events exposing (onInput)
import String


main : Program () Model Msg
main =
  sandbox { init = model, view = view, update = update }


-- MODEL

type alias Model = String

model : Model
model =
  ""

-- UPDATE

type Msg = NewContent Model

update : Msg -> Model -> Model
update (NewContent content) _ =
  content


-- VIEW

view : Model -> Html Msg
view content =
  div []
    [ textarea (myStyle ++ [ placeholder "Text to count",  onInput NewContent ]) []
    , div myStyle [ text <| String.fromInt <| String.length <| String.filter (\c -> c /= '\n') content ]
    ]

myStyle : List (Html.Attribute msg)
myStyle =
    [ style "width" "100%"
    , style "height" "100px"
    , style "padding" "10px 0"
    , style "font-size" "2em"
    , style "text-align" "left"
    ]
