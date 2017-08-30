module Partials.Photography exposing(..)

import Partials.Model exposing (Model)
import Partials.Messages exposing (Msg)

import Html exposing (Html, div, a, p, text, img)
import Html.Attributes exposing (classList, href, style, src)

import Dict exposing (Dict)
import Image exposing (Image)
import Image.Collection as Collection exposing (Key, Collection)
import Maybe exposing (Maybe, withDefault)

import String exposing (slice, split, join)
import List exposing (map, drop)



returnVal : String -> Dict String Image -> Image
returnVal key collection =
  withDefault  (Image "" 350 700) ( Dict.get key collection )

grabListElements elements =
  div [ classList [ ( "photography-container", True ) ] ]
      (map (\l -> div [ classList [ ( "photo-container", True ) ] ] [ img [ src <| slice 1 -1 <| toString <| l ] [] ]) elements )

photographyContent : Model -> Html Msg
photographyContent model =
  grabListElements model.photoPaths
