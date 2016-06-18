;; Haskell related, note had to run 'cabal install hasktags
(require-package 'haskell-mode)
;(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))
(add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)
(eval-after-load "which-func"
  '(add-to-list 'which-func-modes 'haskell-mode))

(let ((my-cabal-path (expand-file-name "~/Library/Haskell/bin")))
  (setenv "PATH" (concat my-cabal-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))

(custom-set-variables '(haskell-tags-on-save t))

; When creating a new file, add module declaration
(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

; Add keybindings to compile haskell code
(eval-after-load "haskell-mode"
    '(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))

(eval-after-load "haskell-cabal"
    '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))
