module Lib
    ( someFunc
    ) where

import Control.Lens ((&), (.~), (?~), (%~))
import Data.Swagger (Swagger, Tag)
import Data.Swagger.Lens (paths, operationId, info, description, tags)
import qualified Data.HashMap.Strict.InsOrd as InsOrdHashMap
import Data.Text (Text(..), pack)
import Data.Set (fromList)
import Data.Monoid

genOpIds :: Swagger -> Swagger
genOpIds = paths %~ InsOrdHashMap.mapWithKey (\k v -> v & operationId ?~ (pack "hello"))

writeInfoTitle :: Swagger -> Swagger
writeInfoTitle = info.description ?~ (pack "whatever description")

writeTags :: [Tag] -> Swagger -> Swagger
writeTags ts = tags %~ (<> fromList ts)

someFunc :: IO ()
someFunc = putStrLn "someFunc"
