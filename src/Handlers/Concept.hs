{-# LANGUAGE OverloadedStrings, RankNTypes #-}

module Handlers.Concept where

import Text.Read (readMaybe)

import Database.Persist (Entity, selectFirst, entityVal)
import Database.Persist.Sql (toSqlKey)

import CourseStitch.Handlers.Utils
import CourseStitch.Handlers.Concept
import CourseStitch.Models.RunDB

import qualified CourseStitch.Templates.Concept as Concept

import qualified Templates

concepts :: RunDB -> ActionM ()
concepts runDB = do
    conceptList <- runDB getConcepts
    (template. Templates.page) $ Concept.concepts conceptList

conceptNew :: RunDB -> ActionM ()
conceptNew runDB = do
    template $ Templates.conceptForm Nothing

conceptEdit :: RunDB -> ActionM ()
conceptEdit runDB = conceptAction runDB $ \name concept topic resources -> do
    template $ Templates.conceptForm $ Just concept

conceptPage :: RunDB -> ActionM ()
conceptPage runDB = conceptAction runDB $ \name concept topic resources -> do
    template $ Templates.conceptPage concept topic resources
