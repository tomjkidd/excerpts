# Purpose

To collect some useful clojure code I've written

# Scripts

[cli-template.clj](./cli-template.clj) is a template that can be downloaded
as a starting point to create a clojure script. Note that in this context,
a script is a clojure program that runs outside of a lein project as a
command line executable.

These scripts assume that
[leiningen](http://leiningen.org/) and
[lein-exec](https://github.com/kumarshantanu/lein-exec)
are installed. The script functionality is provided by lein-exec, and for
any third party libraries that you want to use, it is through leiningen that
they are made available.

# Quickstart

* Open a terminal
* Enter the following commands

```shell
curl -fsSL https://raw.githubusercontent.com/tomjkidd/excerpts/master/tools/clojure/cli-template.clj > test-script.clj
chmod a+x test-script.clj
./test-script.clj
```

These commands should download the template as test-script.clj, add exec
permissions to it, and then attempt to run it.

After verifying that the default options print, you are now free to modify
the file in order to do the work you want.

