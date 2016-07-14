;; Open this file
(global-set-key (kbd "C-c i")
                (lambda ()
                  (interactive)
                  (find-file-other-window "~/.emacs.d/lisp/user-customizations.el")))

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

; USEFUL COMMANDS
; C-h f | look up function definition
; C-h v | look up variable definition
; M-x query-replace | find and replace
; C-x C-e | Evaluate emacs lisp
; C-h m | Show all keybindings
; C-c C-f | Elm Mode, format current file
; C-c C-c | Haskell mode, compile current file
; C-x h | Select entire buffer (select all), mark-whole-buffer
; s-a | On the mac, command all works
; s-z | On the mac, bound to undo
; C-DEL | word backspace, backward-kill-word
; C-u C-M-x | Cider Debug, this will 'instrument' the top-level expression
;           | Optionally, insert #break in code to create breakpoints
;           | Use C-c C-e or the repl to evaluate
;           | n: next c: continue i: step-in o: step-out q: quit
;           | Use C-M-x to stop debugging the marked expression
