
ns digit-comparer.component.chart $ :require $ [] hsl.core :refer $ [] hsl

defn log (x)
  .log js/Math x

defn style-bar
  size color max-data too-large?
  {} (:height |20px)
    :background color
    :display |inline-block
    :width $ str
      if too-large?
        * (log size)
          / 1 $ log max-data
          .-innerWidth js/window
          , 0.5
        * size (/ 1 max-data)
          .-innerWidth js/window
          , 0.5

      , |px

    :vertical-align |middle
    :border-radius |12px

def style-text $ {}
  :color $ hsl 0 0 60
  :vertical-align |middle

def style-pre $ {} (:padding "|8px 20px")
  :margin |0
  :color $ hsl 30 40 80

def style-board $ {} $ :padding "|10px 20px"

def style-line $ {} $ :padding-top |4px

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
        max-data $ apply max $ map first $ vals $ :data props
        min-data $ apply min $ map first $ vals $ :data props
        too-large? $ >
          / (.abs js/Math max-data)
            + 1 $ .abs js/Math min-data
          , 100

      -- .log js/console "|find max data:" max-data
      [] :div ({})
        [] :pre $ {} :style style-pre :inner-text $ pr-str $ :data props
        [] :div ({} :style style-board)
          ->> (:data props)
            map-indexed $ fn (index entry)
              -- .log js/console "|this is entry:" $ first $ last entry
              [] (key entry)
                [] :div
                  {} $ :style style-line
                  [] :div $ {} $ :style $ style-bar
                    first $ last entry
                    get colors index
                    , max-data too-large?
                  [] :div $ {} $ :style style-space
                  [] :span $ {} :inner-text $ last $ last entry

            into $ {}
