
ns digit-comparer.server $ :require
  [] clojure.string :as string
  [] cljs.nodejs :as nodejs

defn -main ()
  nodejs/enable-util-print!
  println "|Server started!"

set! *main-cli-fn* -main
