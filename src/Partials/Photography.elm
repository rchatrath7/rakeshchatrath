module Partials.Photography exposing(..)

import Partials.Messages exposing (Msg)

import Html exposing (Html, div, a, p, text)
import Html.Attributes exposing (classList, href, style)

import Dict exposing (Dict)
import Image exposing (Image)
import Image.Collection as Collection exposing (Key, Collection)
import Maybe exposing (Maybe, withDefault)


returnVal : String -> Dict String Image -> Image
returnVal key collection =
  withDefault  (Image "" 350 700) ( Dict.get key collection )

colorOfBeauty : Collection
colorOfBeauty =
  Dict.fromList
    [ ( "naomi-strk-close", Image "src/static/img/photography/color-of-beauty/naomi-strk-close.jpg" 6000 6000 )
    , ( "allison-blue", Image "src/static/img/photography/color-of-beauty/allison-blue.jpg" 6000 6000 )
    , ( "naomi-strk-long", Image "src/static/img/photography/color-of-beauty/naomi-strk-long.jpg" 6000 6000 )
    , ( "allison-strk-close", Image "src/static/img/photography/color-of-beauty/allison-strk-close.jpg" 6000 6000 )
    , ( "naomi-blue", Image "src/static/img/photography/color-of-beauty/naomi-blue.jpg" 6000 6000 )
    , ( "allison-strk-long", Image "src/static/img/photography/color-of-beauty/allison-strk-long.jpg" 6000 6000 )
    ]

photographyContent : Html Msg
photographyContent =
  div [ classList [ ( "photography-container", True ) ] ]
      [ div [ classList [ ( "photo-container", True ) ] ] [ Image.viewImg [ style [ ( "width", "100%" ) ] ] <| returnVal "naomi-strk-close" colorOfBeauty ]
      , div [ classList [ ( "photo-container", True ) ] ] [ Image.viewImg [ style [ ( "width", "100%" ) ] ] <| returnVal "allison-blue" colorOfBeauty ]
      , div [ classList [ ( "photo-container", True ) ] ] [ Image.viewImg [ style [ ( "width", "100%" ) ] ] <| returnVal "allison-strk-long" colorOfBeauty ]
      , div [ classList [ ( "photo-container", True ) ] ] [ Image.viewImg [ style [ ( "width", "100%" ) ] ] <| returnVal "naomi-blue" colorOfBeauty ]
      , div [ classList [ ( "photo-container", True ) ] ] [ Image.viewImg [ style [ ( "width", "100%" ) ] ] <| returnVal "naomi-strk-long" colorOfBeauty ]
      , div [ classList [ ( "photo-container", True ) ] ] [ Image.viewImg [ style [ ( "width", "100%" ) ] ] <| returnVal "allison-strk-close" colorOfBeauty ]
      ]
