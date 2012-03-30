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
  where a = "rsync -av --delete _site/ www.WonderRabbitProject.net:/srv/http/WonderRabbitProject.net/www/test/"

main :: IO ()
main = hakyllWith conf $ do
  
  match "favicon.ico" $ do
    route   idRoute
    compile copyFileCompiler
    
  match "fonts/*.woff" $ do
    route   idRoute
    compile copyFileCompiler
  
  match "**.jpeg" $ do
    route   idRoute
    compile copyFileCompiler
  
  match "**.png" $ do
    route   idRoute
    compile copyFileCompiler
  
  match "**.svg" $ do
    route   idRoute
    compile copyFileCompiler
  
  match "**.css" $ do
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

  match "*.markdown" $ do
    route   $ setExtension ""
    compile $ pageCompilerWithPandoc
        defaultHakyllParserState
        defaultHakyllWriterOptions
        id
      >>> applyTemplateCompiler "templates/article.html"
      >>> applyTemplateCompiler "templates/global_footer.html"
      >>> applyTemplateCompiler "templates/global_header.html"
      >>> applyTemplateCompiler "templates/global_head_title.html"
      >>> applyTemplateCompiler "templates/global_head_css.html"
      >>> applyTemplateCompiler "templates/global_head.html"
      >>> relativizeUrlsCompiler
  
  match "**.markdown" $ do
    route   $ setExtension ""
    compile $ pageCompilerWithPandoc
        defaultHakyllParserState
        defaultHakyllWriterOptions
        id
      >>> applyTemplateCompiler "templates/article_has_parent.html"
      >>> applyTemplateCompiler "templates/global_footer.html"
      >>> applyTemplateCompiler "templates/global_header.html"
      >>> applyTemplateCompiler "templates/global_head_title_has_parent.html"
      >>> applyTemplateCompiler "templates/global_head_css.html"
      >>> applyTemplateCompiler "templates/global_head.html"
      >>> relativizeUrlsCompiler

{--
cleverCSSFilter :: String -> String
cleverCSSFilter i =
  case (unsafePerformIO $ cleverCSSConvert [] i []) of
    Right r -> r
--}

\end{code}

