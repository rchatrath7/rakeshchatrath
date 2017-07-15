import './static/css/main.css'
const iconPath = require('./static/img/logo.svg')
const Elm = require('./partials/App.elm')

const root = document.getElementById('root')

Elm.App.embed(root, iconPath)
