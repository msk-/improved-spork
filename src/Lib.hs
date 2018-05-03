module Lib
    ( someFunc
    ) where

import Control.Lens ((&), (.~), (?~), Traversal', (%~), each)
import Data.Swagger (Swagger)
import Data.Swagger.Lens (paths, operationId)
import qualified Data.HashMap.Strict.InsOrd as InsOrdHashMap
import Data.Text (Text(..), pack)

genOpIds :: Swagger -> Swagger
genOpIds = paths %~ InsOrdHashMap.mapWithKey (\k v -> v & operationId ?~ (pack "hello"))

someFunc :: IO ()
someFunc = putStrLn "someFunc"
