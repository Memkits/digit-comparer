
ns digit-comparer.component.container $ :require
  [] hsl.core :refer $ [] hsl
  [] clojure.string :as string
  [] digit-comparer.component.chart :refer $ [] chart-component

def style-app $ {} (:position |absolute)
  :width |100%
  :height |100%
  :background-color $ hsl 80 20 96
  :display |flex

def style-column $ {} $ :flex |1

def style-column-large $ {} (:flex |3)
  :overflow |hidden

def style-text $ {} (:width |100%)
  :min-width |300px
  :border |none
  :outline |none
  :padding "|4px 8px"
  :font-size |16px
  :line-height |24px
  :min-height |200px
  :flex-shrink |0

defn parse-line (index text-line)
  let
    (number-part $ re-find (re-pattern |\d+$) (, text-line))

    -- .log js/console "|Number part:" number-part
    if (some? number-part)
      []
        str (js/parseInt number-part)
          , |- index
        [] (js/parseInt number-part)
          -> text-line
            string/replace (re-pattern |\d+$)
              , |
            .trim

      [] 0 text-line

defn parse-user-draft (text)
  let
    (lines $ ->> text (string/split-lines) (map $ fn (x) (.trim x)) (filter $ fn (x) (not $ empty? x)) (map-indexed parse-line) (into $ {}))

    , lines

defn handle-change (props state)
  fn (simple-event intent set-state)
    .log js/console simple-event
    set-state $ {} :draft $ :value simple-event

def container-component $ {} (:name :container)
  :initial-state $ {} :draft |
  :render $ fn (props state)
    [] :div ({} :style style-app)
      [] :div ({} :style style-column)
        [] :textarea $ {} :style style-text :placeholder "|name   123" :on-change $ handle-change props state
      [] :div ({} :style style-column-large)
        [] chart-component $ {} :data $ parse-user-draft $ :draft state
