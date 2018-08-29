module Partials.Blog exposing(..)

import Partials.Messages exposing (Msg)

import Html exposing (Html, div, a, p, text, h2)
import Html.Attributes exposing (classList, href)

blogContent : Html Msg
blogContent =
  div [ classList [ ( "links-container", True ) ] ]
      [ p [] [ a [ classList [ ( "blog", True ) ]
                 , href "http://blog.rakeshchatrath.me/why-i-started-writing/" ]
                 [ text "Why I started writing" ]
            ]
      , p [] [ a [ classList [ ( "blog", True ) ]
                 , href "https://blog.rakeshchatrath.me/intro-to-web-development/" ]
                 [ text "Intro to Web Development Part 1" ]
            ]

      ]
