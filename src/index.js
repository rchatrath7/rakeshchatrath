import './static/css/main.css'

const logoPath = require('./static/img/logo.svg')
const programmingPath = require('./static/img/programming.svg')
const photographyPath = require('./static/img/photography.svg')
const blogPath = require('./static/img/blog.svg')
const resumePath = require('./static/img/resume.svg')

const Elm = require('./partials/App.elm')

const root = document.getElementById('root')

Elm.App.embed(root, {
  logoPath: logoPath,
  programmingPath: programmingPath,
  photographyPath: photographyPath,
  blogPath: blogPath,
  resumePath: resumePath
});
