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

(import (java.net InetAddress))

;;;;;;;;;;;;;;;;;;; Add your script fns here  ;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;; command line interface fns  ;;;;;;;;;;;;;;;;;;;;;;;

(def cli-options
  "The command line options that are available for the script"
  [;; First three strings describe a short-option, long-option with optional
   ;; example argument description, and a description. All three are optional
   ;; and positional.
   ["-p" "--port PORT" "Port number"
    :default 80
    :parse-fn #(Integer/parseInt %)
    :validate [#(< 0 % 0x10000) "Must be a number between 0 and 65536"]]
   ["-H" "--hostname HOST" "Remote host"
    :default (InetAddress/getByName "localhost")
    ;; Specify a string to output in the default column in the options summary
    ;; if the default value's string representation is very ugly
    :default-desc "localhost"
    :parse-fn #(InetAddress/getByName %)]
   ;; If no required argument description is given, the option is assumed to
   ;; be a boolean option defaulting to nil
   [nil "--detach" "Detach from controlling process"]
   ["-v" nil "Verbosity level; may be specified multiple times to increase value"
    ;; If no long-option is specified, an option :id must be given
    :id :verbosity
    :default 0
    ;; Use assoc-fn to create non-idempotent options
    :assoc-fn (fn [m k _] (update-in m [k] inc))]
   ["-h" "--help"]])

(defn usage [options-summary]
  (->> ["This is my program. There are many like it, but this one is mine."
        ""
        "Usage: program-name [options] action"
        ""
        "Options:"
        options-summary
        ""
        "Actions:"
        "  start    Start a new server"
        "  stop     Stop an existing server"
        "  status   Print a server's status"
        ""
        "Please refer to the manual page for more information."]
       (str/join \newline)))

(defn error-msg [errors]
  (str "The following errors occurred while parsing your command:\n\n"
       (str/join \newline errors)))

(defn exit [status msg]
  (println msg)
  (System/exit status))

(defn -main [& args]
  (let [{:keys [options arguments errors summary]} (parse-opts args cli-options)]
    ;; Handle help and error conditions
    (cond
      (:help options) (exit 0 (usage summary))
      ; Uncomment if you need to process arguments
      ;(not= (count arguments) 1) (exit 1 (usage summary))
      errors (exit 1 (error-msg errors)))

    (println (str "options = " options))
    
    ;;;;;;;;;;;;;;;;;;; Hook into your script fns here  ;;;;;;;;;;;;;;;;;;;;;;;

    ;; Execute program with options
    ; Uncomment if you need to handle arguments
    ;; (case (first arguments)
    ;;   "start" (println "Note implemented. TODO: make call to start function.")
    ;;   "stop" (println "Not implemented. TODO: make call to stop function.")
    ;;   "status" (println "Not implemented. TODO: make call to status function.")
    ;;   (exit 1 (usage summary)))

    ))

(try
  ; If you don't require any m2 libraries, remove the earlier calls that
  ; dynamically load them and uncomment the following line
  ;;(require 'leiningen.exec)
  (when @(ns-resolve 'leiningen.exec '*running?*)
    (apply -main (rest *command-line-args*)))
  (catch java.io.FileNotFoundException e))
