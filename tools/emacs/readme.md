# Motivation
I met Emacs when I started learning clojure, and it was mostly due to the fact that a resource I was using, [Brave Clojure](http://www.braveclojure.com/), pretty much made it [ridiculously easy](http://www.braveclojure.com/basic-emacs/).

The [configuration files](https://github.com/flyingmachine/emacs-for-clojure) used in Brave Clojure brought me pretty far, and then one day I saw [Parens of the Dead](http://www.parens-of-the-dead.com/) and figured out that [clj-refactor](https://github.com/clojure-emacs/clj-refactor.el) was being used to provide even more functionality. I found a [clojure-emacs example configuration](https://github.com/clojure-emacs/example-config) and decided to fuse it with the one from Brave Clojure. So began my journey of learning how to manage configuration of emacs.

The result of this effort is my [user-customizations.el]() file, which is used in the way [described in the clojure-emacs example config](https://github.com/clojure-emacs/example-config/blob/master/init.el#L73). This file could be broken out to be more modular, but for now I just want to capture a known useful state.

## Windows Specific issues
In the process of getting documentation and navigate to code to work, CIDER reported errors about not being able to find libraries, so having resolved those issues, I wanted to document them in case I encounter them again in the future.

* [zlib](http://zlib.net/)
  * Download zlib1.dll binary (64 bit!)
  * Place the binary in the same directory as emacs.exe
* [unzip](http://gnuwin32.sourceforge.net/packages/unzip.htm)
  * Download the binaries
  * Add an environment variable to include the directory where you download the binaries to


