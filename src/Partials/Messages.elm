module Partials.Messages exposing (..)

import Navigation

type Msg
  = Programming
  | Photography
  | Blog
  | Resume
  | Default
  | ScrollDown
  | UrlChange Navigation.Location
  | ShowMobile
  | HideMobile
