{-# LANGUAGE OverloadedStrings #-}

module Template (
    module Template.Resource,
    module Template.Concept,
    module Template.Topic,
    template
) where

import Template.Resource
import Template.Concept
import Template.Topic

import Web.Scotty (ActionM, raw, setHeader)
import Lucid (Html, renderBS)

template :: Html () -> ActionM ()
template html = do
    setHeader "Content-Type" "text/html"
    raw . renderBS $ html
