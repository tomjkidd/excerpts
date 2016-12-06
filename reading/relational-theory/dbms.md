I've been pursuing knowledge in the domain of relational theory with a goal of understanding Database Management System implementation.

# Resources

[Relational Theory for Computer Professionals book](https://books.google.com/books?id=YTifkN2VnvAC&pg=PP3&lpg=PP3&dq=C+J+Date+relational+theory+for+computer+professionals&source=bl&ots=tjNBJQznMa&sig=iZVi-Z7zwk7h5lvr6VIhQuZpxa4&hl=en&sa=X&ved=0ahUKEwiEt7rOps7QAhVhh1QKHcq6CwIQ6AEISTAJ#v=onepage&q=C%20J%20Date%20relational%20theory%20for%20computer%20professionals&f=false)

[Relational Theory for Computer Professionals video](https://www.youtube.com/watch?v=qx0F7TfA8CI)

[Out of the Tar Pit](https://github.com/papers-we-love/papers-we-love/blob/master/design/out-of-the-tar-pit.pdf)

[Deconstructing The Database](https://www.infoq.com/presentations/Deconstructing-Database)

[Database System Concepts book](http://www.jordomseiling.org/Database%20System%20Concepts%206th%20edition.pdf)

[Datomic tutorial](http://docs.datomic.com/tutorial.html)

[Datomic queries](http://docs.datomic.com/query.html)

[Hitchhiker Tree](https://github.com/datacrypt-project/hitchhiker-tree)

[Hitchhiker Trees Video](https://www.youtube.com/watch?v=jdn617M3-P4)

[Introduction to Algorithms(CLRS)](https://mitpress.mit.edu/books/introduction-algorithms)

[Datalog and Emerging Applications: An Interactive Tutorial](http://web.cs.ucdavis.edu/~green/papers/sigmod906t-huang.pdf)
* Survey, primarily useful for references provided

[Foundations of Databases: The Logical Level](https://www.amazon.com/Foundations-Databases-Logical-Serge-Abiteboul/dp/0201537710/ref=pd_sbs_14_t_1?_encoding=UTF8&psc=1&refRID=CHZ6FKE8S8Y7GJYE2E13)

[BOOM Analytics: Exploring Data-Centric, Declarative Programming for the Cloud](http://db.cs.berkeley.edu/papers/eurosys10-boom.pdf)

[Dedalus: Datalog in Time and Space](https://www2.eecs.berkeley.edu/Pubs/TechRpts/2009/EECS-2009-173.pdf)

[What You Always Wanted to Know About Datalog](http://www.csd.uoc.gr/~hy562/1112_spring/instr_material/WhatYouAlwaysWantedtoKnowAboutDatalog_AndNeverDaredtoAsk.pdf)
* 1989

[Datalog User Manual](http://www.ccs.neu.edu/home/ramsdell/tools/datalog/datalog.html)
* Has useful links and documentation for Datalog in general
* C/Lua Project [Source Code](https://sourceforge.net/projects/datalog/files/datalog/2.2/)

[Bigtable: A Distributed Storage System for Structured Data](http://static.googleusercontent.com/media/research.google.com/en//archive/bigtable-osdi06.pdf)

[Dynamo: Amazon's Highly Available Key-value Store](http://www.allthingsdistributed.com/files/amazon-dynamo-sosp2007.pdf)

[Stratified B-trees and versioning dictionaries](https://arxiv.org/pdf/1103.4282v2.pdf)

[Versioned external-memory dictionaries with optimal query/update tradeoffs](https://arxiv.org/pdf/1103.2566v2.pdf)

[Fast Database Restarts at Facebook](https://research.fb.com/wp-content/uploads/2016/11/fast-database-restarts-at-facebook.pdf?)

[The Design and Implementation of a Log-Structured File System](http://citeseerx.ist.psu.edu/viewdoc/download;jsessionid=F14A8A117B40666F1512FD8785FECA47?doi=10.1.1.41.8933&rep=rep1&type=pdf)

[Persistent B+-Trees in Non-Volatile Main Memory](http://www.vldb.org/pvldb/vol8/p786-chen.pdf)

[Fully Persistent B-Trees](http://www.cs.au.dk/~gerth/papers/soda12.pdf)

## Wiki

[Database index](https://en.wikipedia.org/wiki/Database_index)

[B+ Tree](https://en.wikipedia.org/wiki/B%2B_tree)

## From Derek

[A General Purpose Log Structured Merge Tree](http://www.eecs.harvard.edu/~margo/cs165/papers/gp-lsm.pdf)

[Optimizing Optimistic Concurrency Control for Tree-Structured, Log-Structured Databases](http://www.cs.cornell.edu/~blding/pub/hyder_sigmod_2015.pdf)

[Architecture of a Database System](http://db.cs.berkeley.edu/papers/fntdb07-architecture.pdf)

[Linear Tabling Strategies and Optimizations](https://arxiv.org/pdf/0705.3468v1.pdf)

## Stack Overflow

[Tree differences](http://stackoverflow.com/questions/20816698/why-does-couchdb-use-an-append-only-b-tree-and-not-a-hamt)
* The response by David Jeske was useful

## Blogs

[Persistent Trees in git, Clojure, and CouchDB by Manuel Woelker](http://eclipsesource.com/blogs/2009/12/13/persistent-trees-in-git-clojure-and-couchdb-data-structure-convergence/)
* Pretty good summary of tree work circa 2009, and some links to good talks

[Getting Git by Scott Chacon 2008](https://vimeo.com/14629850)
* Very cool slide about the time breakdown of the presentation to start
* 2:13 for list of typically used commands

[B+ Trees and why I love them, Part I](https://ayende.com/blog/162945/b-trees-and-why-i-love-them-part-i)

[B+ Trees Visualization](http://www.cs.usfca.edu/~galles/visualization/BPlusTree.html)

## Software

[JDBM3](https://github.com/jankotek/JDBM3)

[Clojure b-plus-tree](https://github.com/dwysocki/b-plus-tree)

[Clojure btree](https://github.com/phlegmaticprogrammer/btree)

# Notes

KEY: Keep in mind the following distinction

Logical Database -> DBMS -> Physical Database

## Out of the Tar Pit

* Essential State: Base relvars
* Essential Logic: Business Logic functions and Internal/External Derived Relations
* Accidental State and Control: performance hints for caching, denormalization, and blob/variable length attribute storage

[Kow79](https://www.doc.ic.ac.uk/~rak/papers/algorithm%20=%20logic%20+%20control.pdf)

[Mer85, behind paywall](http://link.springer.com/chapter/10.1007%2F978-3-642-61556-6_12#page-1)

## Hitchhiker Trees

* Binary Tree
* B Tree
* B+ Tree: Index and Data nodes
* Fractal Tree: Index and Data nodes, buffer. Update in place
* Hitchhiker Tree: Index and Data nodes, buffer. Path copying

Block size: 4kB to 1MB
