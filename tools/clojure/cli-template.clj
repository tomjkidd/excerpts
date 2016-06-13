(require '[clojure.tools.cli :refer [parse-opts]])

(def cli-opts
  [["-s" "--string STRING" "String Argument"
    :default "this is a default string"]
   ["-i" "--int I" "Int Argument"
    :default 12
    :parse-fn #(Integer/parseInt %)]])

(defn -main [& args]
  (let [{:keys [options arguments errors summary]} (parse-opts args cli-opts)]
    (println (str "options = " options))))

(try
  (require 'leiningen.exec)
  (when @(ns-resolve 'leiningen.exec '*running?*)
    (apply -main (rest *command-line-args*)))
  (catch java.io.FileNotFoundException e))
