
ns digit-comparer.updater.core $ :require $ [] hsl.core :refer $ [] hsl

defn updater
  old-store op-type op-data op-id
  .log js/console "|Updater is not ready..."
  case op-type
    :add $ update old-store :count inc
    , old-store
