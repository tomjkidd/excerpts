# Purpose

This all was necessary because Ally wouldn't let me look further back than
18 months for CSV data. Considering it was provided on the page, I decided
to pull it by scraping html that was extraced using Chrome's developer tools.

The [.html]() file holds the transactions in a list of tables per year.
This table was grabbed by logging in through a web browser and using
the "Copy element" functionality provided by the Chrome developer tools

The [ally-bank-scraper.clj](./ally-bank-scraper.clj) file is the script to run agains the html file. It handles
parsing out the useful information about each transaction.

The [.edn](ally-transactions.edn) file is the resulting edn data, which can
be loaded into clojure with [read-string](http://clojuredocs.org/clojure.core/read-string)

TODO: Update html file to include example data that is ok to put online
TODO: Include edn file generated from example data
