{-# LANGUAGE OverloadedStrings #-}
import Control.Arrow ((>>>))
import Hakyll

main = hakyll $ do
  
  match "/favicon.ico" $ do
    route   idRoute
    compile copyFileCompiler
  
  match "images/" $ do
    route   idRoute
    compile copyFileCompiler

  match "css/*" $ do
    route   idRoute
    compile compressCssCompiler

  match "templates/*" $ compile templateCompiler

  match "*.tex" $ do
    route   $ setExtension "html"
    compile $ pageCompiler
      >>> applyTemplateCompiler "templates/default.html"
      >>> relativizeUrlsCompiler

