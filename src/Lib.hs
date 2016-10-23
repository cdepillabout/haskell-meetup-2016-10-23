{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Lib
    ( someFunc
    ) where

import Control.Monad.IO.Class (liftIO)
import Data.ByteString.Lazy (ByteString)
import Data.Text.Lazy (Text, pack)
import Network.HTTP.Simple (Request, Response, getResponseBody, httpLBS, parseRequest_)
import Web.Scotty (ScottyM, get, param, raw, scotty, text)

someFunc :: IO ()
someFunc = scotty 10000 myScottyM

myScottyM :: ScottyM ()
myScottyM = do
    get "/add" (text "helloooo")
    -- get "/add/:x/:y" $ do
    --     x <- param "x"
    --     y <- param "y"
    --     text $ pack $ show $ addInt x y
    get "/add/:x/:y" $
        param "x" >>= \x ->
            param "y" >>= \y ->
                text $ pack $ show $ addInt x y
    get "/proxy/:url" $ do
        url <- param "url"
        liftIO $ print $ "We got url: " ++ url
        webPage <- liftIO $ fetchUrl url
        raw webPage
  where
    addInt :: Int -> Int -> Int
    addInt = (+)

fetchUrl :: String -> IO ByteString
fetchUrl url = do
    -- TODO: Don't know why we can't use the url...?
    let (request :: Request) = parseRequest_ "http://www.google.com"
    (response :: Response ByteString) <- httpLBS request
    return (getResponseBody response :: ByteString)
