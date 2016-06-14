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
         '[net.cgrand.enlive-html :refer [html-resource select text first-child nth-child has but]]
         '[clj-time.format :refer [formatter parse]])

;;;;;;;;;;;;;;;;;;; scrape fns  ;;;;;;;;;;;;;;;;;;;;;;;

(def date-formatter
  "A formatter that corresponds to the dates found in the ally page"
  (formatter "MMMMMMMM dd, YYYY"))

(def sanitizer #"[^a-zA-Z0-9\.\,\$\(\) ]*") ; NOTE: There is a space in the regex

(defn scrape-col-text
  [row selector]
  (let [val (-> (select row selector)
                first
                text
                (str/replace sanitizer "")
                (str/trim)
                )]
    val))

(defn col-selector
  [zero-index]
  [:td (nth-child (+ 1 zero-index))])

(defn scrape-row
  "Pull the column values from a row into a hashmap"
  [row]
  (let [date (->> (scrape-col-text row [(col-selector 0)])
                  (parse date-formatter)
                  (.toDate))
        description (scrape-col-text row [(col-selector 1) :a])
        amount (scrape-col-text row [(col-selector 2)])
        balance (scrape-col-text row [(col-selector 3)])]
    {:date date
     :description description
     :amount amount
     :balance balance}))

(defn scrape-year
  "Parse table that represents a year's transactions"
  [year-data]
  (let [headers (select year-data [:thead :tr :th text])
        rows (select year-data [:tbody :tr])
        ; Even indexed rows have a distinct td with class description.
        ; Even rows provide (Date Description Amount Balance
        ; Odd rows provide (Amount PostingDate PostingTime Type)
        ; Odd indexed rows provide 
        ; NOTE: Here, I'm refering to 0-indexed rows in table!
        even-data-rows (select rows [[:tr (has [:td.description])]])
        odd-data-rows (select rows [[:tr (but (has [:td.description]))]])
        ; Partitioned by the number of columns per row
        row-data even-data-rows]
    (map scrape-row row-data)))

(defn scrape
  "Scrapes an html string formatted for the table pulled from the Ally Bank webpage"
  [input-filepath]
  (println (format "Attempting to read %1$s" input-filepath))
  (let [html (html-resource (java.io.File. input-filepath))
        years (select html [:table.transactions-history-table])
        scraped-by-year (map scrape-year years)
        transactions (apply concat scraped-by-year)]
    transactions))

(defn transaction-summary
  "A simple toString function to summarize a transaction"
  [{:keys [date description amount balance]}]
  (format "%1$s\t%2$s\t%3$s\t%4$s" date description amount balance))

;;;;;;;;;;;;;;;;;;; command line interface fns  ;;;;;;;;;;;;;;;;;;;;;;;

(def cli-opts
  "The command line options that are available for the script"
  [["-i" "--input-filepath STRING" "The input-filepath that is the html to parse"
    :default "AllyMoneyMarket.html"]
   ["-o" "--output-filepath STRING" "The output-filepath used to save the parsed transactions"
    :default "ally-transactions.edn"]])

(defn -main [& args]
  "The main function that is called with run with lein exec"
  (let [{:keys [options arguments errors summary]} (parse-opts args cli-opts)
        transactions (scrape (:input-filepath options))]
    (println (str "options = " options))

    (doall (map #(println (transaction-summary %)) transactions))
    (println (format "%1$s transactions detected" (count transactions)))

    (spit (:output-filepath options) (pr-str transactions))))

(try
  (when @(ns-resolve 'leiningen.exec '*running?*)
    (apply -main (rest *command-line-args*)))
  (catch java.io.FileNotFoundException e))
