module Partials.Programming exposing(..)

import Partials.Messages exposing (Msg)

import Html exposing (Html, div, img)
import Html.Attributes exposing (src, classList, href, style)

import Dict exposing (Dict)
import Image exposing (Image)
import Image.Collection as Collection exposing (Key, Collection)
import Maybe exposing (Maybe, withDefault)

collection : Collection
collection =
  Dict.fromList
    [ ( "recon", Image "src/static/img/programming/recon.png" 56 56 )
    , ( "raise", Image "src/static/img/programming/raise.png" 56 56 )
    , ( "riverside", Image "src/static/img/programming/riverside-medical-center-squarelogo.png" 56 56 )
    , ( "projects", Image "src/static/img/programming/projects.svg" 56 56 )
    , ( "logo", Image "src/static/img/logo.svg" 56 56)
    ]

returnVal : String -> Dict String Image -> Image
returnVal key collection =
  withDefault  (Image "" 0 0) ( Dict.get key collection )

programmingContent : Html Msg
programmingContent =
  div [ classList [ ( "programming-body", True ) ] ]
      [ div [ classList [ ( "programming-sidebar", True ) ] ]
            [ div [ classList [ ( "programming-timeline-block", True ) ] ]
                  [ div [ classList [ ( "programming-timeline-picture", True ) ] ]
                        [ Image.viewImg [ style [ ( "width", "100%" ), ( "height", "100%" ) ] ] <| returnVal "recon" collection ]
                  , div [ classList [ ( "programming-timeline-card", True ) ] ] []
                  ]
            , div [ classList [ ( "programming-timeline-block", True ) ] ]
                  [ div [ classList [ ( "programming-timeline-picture", True ) ] ]
                        [ Image.viewImg [ style [ ( "width", "100%" ), ( "height", "100%" ) ] ] <| returnVal "raise" collection ]
                  ]
            , div [ classList [ ( "programming-timeline-block", True ) ] ]
                  [ div [ classList [ ( "programming-timeline-picture", True ) ] ]
                        [ Image.viewImg [ style [ ( "width", "100%" ), ( "height", "100%" ) ] ] <| returnVal "riverside" collection ]
                  ]
            , div [ classList [ ( "programming-timeline-block", True ) ] ]
                  [ div [ classList [ ( "programming-timeline-picture", True ) ] ]
                        [ Image.viewImg [ style [ ( "width", "100%" ), ( "height", "100%" ) ] ] <| returnVal "projects" collection ]
                  ]
            ]
      , div [ classList [ ( "programming-content", True ) ] ]
            [ div [ classList [ ( "projects-container", True ) ] ]
                  [ div [ classList [ ("project-card", True ) ] ]
                        [

                        ]
                  ]
            ]

      ]
