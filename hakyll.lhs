#!/usr/bin/runhaskell
\begin{code}
{-# LANGUAGE OverloadedStrings #-}
import Control.Arrow ((>>>))
--import Control.Arrow ((>>^))
import Hakyll
--import Text.CSS.CleverCSS
--import System.IO.Unsafe

config :: HakyllConfiguration
config = defaultHakyllConfiguration { deployCommand = a }
  where a = "rsync -av --delete _site/ WonderRabbitProject.net:/srv/http/WonderRabbitProject.net/www/v20.trunk/"

main :: IO ()
main = hakyll $ do
  
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
  
  match "**.markdown" $ do
    route   $ setExtension "html"
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

