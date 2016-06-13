(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(require-package 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

'(markdown-css-paths (quote "./style.css"))
