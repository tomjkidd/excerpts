#! /bin/sh lein exec
; -*- Clojure -*-

(require 'leiningen.exec)

;; Add dependencies to the classpath on the fly
;; NOTE: This requires that they are in your m2 repository already 
(leiningen.exec/deps '[[enlive "1.1.6"]
                       [clj-time "0.12.0"]])

;; Now dependencies are available like in a regular lein project
(require '[clojure.string :as str]
         '[clojure.tools.cli :refer [parse-opts]]
         '[net.cgrand.enlive-html :refer [html-resource select text first-child]]
         '[clj-time.format :refer [formatter parse]])

;;;;;;;;;;;;;;;;;;; Add your script fns here  ;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;; command line interface fns  ;;;;;;;;;;;;;;;;;;;;;;;

(def cli-opts
  "The command line options that are available for the script"
  [["-s" "--string STRING" "String Argument"
    :default "this is a default string"]
   ["-i" "--int I" "Int Argument"
    :default 12
    :parse-fn #(Integer/parseInt %)]])

(defn -main [& args]
  "The main function that is called with run with lein exec"
  (let [{:keys [options arguments errors summary]} (parse-opts args cli-opts)]
    (println (str "options = " options))))

(try
  ; If you don't require any m2 libraries, remove the earlier calls that
  ; dynamically load them and uncomment the following line
  ;;(require 'leiningen.exec)
  (when @(ns-resolve 'leiningen.exec '*running?*)
    (apply -main (rest *command-line-args*)))
  (catch java.io.FileNotFoundException e))
