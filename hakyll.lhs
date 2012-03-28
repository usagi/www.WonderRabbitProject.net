#!/usr/bin/runhaskell
\begin{code}
{-# LANGUAGE OverloadedStrings #-}
import Control.Arrow ((>>>))
--import Control.Arrow ((>>^))
import Hakyll
--import Text.CSS.CleverCSS
--import System.IO.Unsafe

conf :: HakyllConfiguration
conf = defaultHakyllConfiguration { deployCommand = a }
  where a = "git add . && git commit -m \"hakyll deploy\" && git push"

main :: IO ()
main = hakyllWith conf $ do
  
  match "favicon.ico" $ do
    route   idRoute
    compile copyFileCompiler
  
  match "images/" $ do
    route   idRoute
    compile copyFileCompiler
  
  match "css/*.css" $ do
    route   idRoute
    compile compressCssCompiler
    
  {--
  match "css/*.clevercss" $ do
    route   $ setExtension "css"
    compile $ getResourceString
      >>^ cleverCSSFilter
      >>^ compressCss
  --}
  
  match "templates/*" $ compile templateCompiler
  
  match "status-*.markdown" $ do
    route   $ setExtension ""
    compile $ pageCompiler
      >>> applyTemplateCompiler "templates/status.html"

  match "**.markdown" $ do
    route   $ setExtension ""
    compile $ pageCompiler
      >>> applyTemplateCompiler "templates/default.html"
      >>> relativizeUrlsCompiler

{--
cleverCSSFilter :: String -> String
cleverCSSFilter i =
  case (unsafePerformIO $ cleverCSSConvert [] i []) of
    Right r -> r
--}

\end{code}

