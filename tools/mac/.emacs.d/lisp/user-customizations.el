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

(setq-default
 whitespace-line-column 72
 whitespace-style       '(face lines-tail))

(add-hook 'markdown-mode-hook #'whitespace-mode)

;(require-package 'column-marker)


;(setq column-marker-1 60)

;(add-hook 'markdown-mode-hook (lambda () (interactive) (column-marker-1 60)))

;(require-package 'fill-column-indicator)
;(setq fci-rule-column 70)
;(setq fci-rule-width 1)
;(setq fci-rule-color "darkblue")


;(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
;                                                                     (global-fci-mode 1)

