;; Open this file
(global-set-key (kbd "C-c i")
                (lambda ()
                  (interactive)
                  (find-file-other-window "~/.emacs.d/lisp/user-customizations.el")))

(require-package 'f)
(require-package 's)
(require-package 'elm-mode)

(require-package 'which-key)
(which-key-mode)

(require-package 'clojure-cheatsheet)
