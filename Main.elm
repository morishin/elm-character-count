import Html exposing (Html, Attribute, beginnerProgram, text, div, textarea)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String


main =
  beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model = String

model : Model
model =
  ""

-- UPDATE

type Msg = NewContent Model

update : Msg -> Model -> Model
update (NewContent content) oldContent =
  content


-- VIEW

view : Model -> Html Msg
view content =
  div []
    [ textarea [ placeholder "Text to count",  onInput NewContent, myStyle ] []
    , div [ myStyle ] [ text <| toString <| String.length <| String.filter (\c -> c /= '\n') content ]
    ]

myStyle =
  style
    [ ("width", "100%")
    , ("height", "100px")
    , ("padding", "10px 0")
    , ("font-size", "2em")
    , ("text-align", "left")
    ]
