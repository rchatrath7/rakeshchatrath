module Partials.Programming exposing(..)

import Partials.Messages exposing (Msg)

import Html exposing (Html, div, img, a, section, span, h2, text, p)
import Html.Attributes exposing (src, classList, href, style, id)

import Dict exposing (Dict)
import Image exposing (Image)
import Image.Collection as Collection exposing (Key, Collection)
import Maybe exposing (Maybe, withDefault)

collection : Collection
collection =
  Dict.fromList
    [ ( "recon", Image "src/static/img/programming/recon.png" 350 350 )
    , ( "raise", Image "src/static/img/programming/raise.png" 250 250 )
    , ( "riverside", Image "src/static/img/programming/riverside-medical-center-squarelogo.png" 300 300 )
    , ( "projects", Image "src/static/img/programming/projects.svg" 250 250 )
    , ( "logo", Image "src/static/img/logo.svg" 56 56)
    ]

returnVal : String -> Dict String Image -> Image
returnVal key collection =
  withDefault  (Image "" 0 0) ( Dict.get key collection )

programmingContent : Html Msg
programmingContent =
  section [ id "timeline" ]
          [ div [ classList [ ( "demo-card-wrapper", True ) ] ]
                [ div [ classList [ ( "demo-card", True )
                                  , ( "demo-card--step1", True )
                                  ]
                      ]
                      [ div [ classList [ ( "head", True ) ] ]
                            [ div [ classList [ ( "number-box", True ) ] ]
                                  [ span [] [ text "2016.17" ] ]
                            , h2 [] [ span [ classList [ ( "small", True ) ] ] [ text "Web Development Consultant" ]
                                    , text "Recon Sports Consultants"
                                    ]
                            ]
                      , div [ classList [ ( "body", True ) ] ]
                            [ p [] [ text "Recon Sports is a platform that pairs prospective hockey players with college scouts. I improved the existing platform by adding a unit and end-end test framework, a subscription-based payment platform, as well as improved performance of the application by several times." ]
                            , Image.viewImg [ style [ ( "width", "100%" ), ( "height", "100%" ) ] ] <| returnVal "recon" collection
                            ]
                      ]
                , div [ classList [ ( "demo-card", True )
                                  , ( "demo-card--step2", True )
                                  ]
                      ]
                      [ div [ classList [ ( "head", True ) ] ]
                            [ div [ classList [ ( "number-box", True ) ] ]
                                  [ span [] [ text "2016.17" ] ]
                            , h2 [] [ span [ classList [ ( "small", True ) ] ] [ text "Web Development Consultant" ]
                                    , text "Raise Inc."
                                    ]
                            ]
                      , div [ classList [ ( "body", True ) ] ]
                            [ p [] [ text "At Raise, I built a platform to automate their onboarding process. I created an interface in which potential contracters could begin the consultant process by gathering their legal information and generating a variety of forms (e.g. NDA) that could be signed by the client with HelloSign." ]
                            , Image.viewImg [ style [ ( "width", "100%" ), ( "height", "100%" ) ] ] <| returnVal "raise" collection
                            ]
                      ]
                , div [ classList [ ( "demo-card", True )
                                  , ( "demo-card--step3", True )
                                  ]
                      ]
                      [ div [ classList [ ( "head", True ) ] ]
                            [ div [ classList [ ( "number-box", True ) ] ]
                                  [ span [] [ text "2016.17" ] ]
                            , h2 [] [ span [ classList [ ( "small", True ) ] ] [ text "Student Researcher" ]
                                    , text "Riverside Medical Center"
                                    ]
                            ]
                      , div [ classList [ ( "body", True ) ] ]
                            [ p [] [ text "I studied the effectiveness of a comprehensive lung cancer committee in reducing the rates of late stage lung cancer cases at a small, community hospital. Here, I used Excel, VBA, and R to find a trend that indicates the lung cancer committee was effective in reducing the amount of late stage lung cancer cases over time." ]
                            , Image.viewImg [ style [ ( "width", "100%" ), ( "height", "100%" ) ] ] <| returnVal "riverside" collection
                            ]
                      ]
                , div [ classList [ ( "demo-card", True )
                                  , ( "demo-card--step4", True )
                                  ]
                      ]
                      [ div [ classList [ ( "head", True ) ] ]
                            [ div [ classList [ ( "number-box", True ) ] ]
                                  [ span [] [ text "2016.17" ] ]
                            , h2 [] [ span [ classList [ ( "small", True ) ] ] [ text "Developer at Heart" ]
                                    , text "Projects"
                                    ]
                            ]
                      , div [ classList [ ( "body", True ) ] ]
                            [ p [] [ text "When not at work, I like to do a variety of projects. These range from things I might be interested in on the side such as data science to this website, or even fun things I do at hackathons like an app that uses computer vision to monitor a users brushing habits. Look below for a full list of projecst." ]
                            , Image.viewImg [ style [ ( "width", "100%" ), ( "height", "100%" ) ] ] <| returnVal "projects" collection
                            ]
                      ]
                ]
          ]

-- programmingContent : Html Msg
-- programmingContent =
--   div [ classList [ ( "programming-body", True ) ] ]
--       [ div [ classList [ ( "programming-sidebar", True ) ] ]
--             [ div [ classList [ ( "programming-timeline-block", True ) ] ]
--                   [ div [ classList [ ( "programming-timeline-picture", True ) ] ]
--                         [ a [ href "#/programming/#recon" ] [ Image.viewImg [ style [ ( "width", "100%" ), ( "height", "100%" ) ] ] <| returnVal "recon" collection ] ]
--                   , div [ classList [ ( "programming-timeline-card", True ) ] ] []
--                   ]
--             , div [ classList [ ( "programming-timeline-block", True ) ] ]
--                   [ div [ classList [ ( "programming-timeline-picture", True ) ] ]
--                         [ Image.viewImg [ style [ ( "width", "100%" ), ( "height", "100%" ) ] ] <| returnVal "raise" collection ]
--                   ]
--             , div [ classList [ ( "programming-timeline-block", True ) ] ]
--                   [ div [ classList [ ( "programming-timeline-picture", True ) ] ]
--                         [ Image.viewImg [ style [ ( "width", "100%" ), ( "height", "100%" ) ] ] <| returnVal "riverside" collection ]
--                   ]
--             , div [ classList [ ( "programming-timeline-block", True ) ] ]
--                   [ div [ classList [ ( "programming-timeline-picture", True ) ] ]
--                         [ Image.viewImg [ style [ ( "width", "100%" ), ( "height", "100%" ) ] ] <| returnVal "projects" collection ]
--                   ]
--             ]
--       , div [ classList [ ( "programming-content", True ) ] ]
--             [ div [ classList [ ( "projects-container", True ) ] ]
--                   [ div [ classList [ ("project-card", True ) ] ]
--                         [
--
--                         ]
--                   ]
--             ]
--
--       ]
