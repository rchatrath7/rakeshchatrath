import './static/css/main.css'

function requireAll(requireContext) {
  return requireContext.keys().map(requireContext);
}

const logoPath = require('./static/img/logo.svg')
const programmingPath = require('./static/img/programming.svg')
const photographyPath = require('./static/img/photography.svg')
const blogPath = require('./static/img/blog.svg')
const resumePath = require('./static/img/resume.svg')
const resume = require('./static/pdf/resume.pdf')

const photoPaths = requireAll(require.context('./static/img/photography', true, /\.jpg$/));
const programmingAssetPaths = requireAll(require.context('./static/img/programming/asset-logos', true, /\./));
const programmingProjectPaths = requireAll(require.context('./static/img/programming/project-logos', true, /\./));

const Elm = require('./Partials/App.elm')

const root = document.getElementById('root')

Elm.App.embed(root, {
  logoPath: logoPath,
  programmingPath: programmingPath,
  photographyPath: photographyPath,
  blogPath: blogPath,
  resumePath: resumePath,
  resume: resume,
  photoPaths: photoPaths,
  programmingAssetPaths: programmingAssetPaths,
  programmingProjectPaths: programmingProjectPaths,
});
