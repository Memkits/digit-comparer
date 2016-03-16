
ns digit-comparer.component.chart $ :require $ [] hsl.core :refer $ [] hsl

defn style-bar (size color max-data)
  {} (:height |30px)
    :background color
    :display |inline-block
    :width $ str
      * size (/ 1 max-data)
        .-innerWidth js/window
        , 0.5
      , |px

    :vertical-align |middle

def style-text $ {}
  :color $ hsl 0 0 60
  :vertical-align |middle

defn generate-colors (n)
  let
    (unit $ / 360 n)
    ->> (range n)
      map $ fn (index)
        hsl (* index unit)
          , 60 60

      into $ []

def style-space $ {} (:width |10px)
  :display |inline-block

def chart-component $ {} (:name :chart)
  :initial-state $ {}
  :render $ fn (props state)
    let
      (colors $ generate-colors $ count $ :data props)
        max-data $ apply max $ keys $ :data props
      [] :div ({})
        ->> (:data props)
          map-indexed $ fn (index entry)
            [] (key entry)
              [] :div ({})
                [] :div $ {} $ :style $ style-bar (key entry)
                  get colors index
                  , max-data
                [] :div $ {} $ :style style-space
                [] :span $ {} :inner-text $ val entry

          into $ {}
