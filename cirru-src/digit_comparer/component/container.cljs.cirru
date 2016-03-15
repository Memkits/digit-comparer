
ns digit-comparer.component.container $ :require
  [] hsl.core :refer $ [] hsl
  [] digit-comparer.component.chart :refer $ [] chart-component

def style-app $ {} (:position |absolute)
  :width |100%
  :height |100%
  :background-color $ hsl 80 20 90
  :display |flex

def style-column $ {} $ :flex |1

def style-text $ {} (:width |100%)
  :border |none
  :outline |none
  :padding "|4px 8px"
  :font-size |14px

defn handle-click (props state)
  fn (simple-event intent set-state)
    .log js/console "|Add by one..."
    intent :add nil

def container-component $ {} (:name :container)
  :initial-state $ {} :draft |
  :render $ fn (props state)
    [] :div ({} :style style-app)
      [] :div ({} :style style-column)
        [] :textarea $ {} :style style-text
      [] :div ({} :style style-column)
        [] chart-component $ {}
