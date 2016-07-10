; Ediff customizations
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-merge-split-window-function 'split-window-horizontally)
;(setq ediff-keep-variants nil)

(defun my-ediff-quit (reverse-default-keep-variants)
  "Don't ask if I really want to quit"
  (interactive "P")
  (ediff-barf-if-not-control-buffer)
  (ediff-really-quit reverse-default-keep-variants))

(defun my-ediff-keymap-setup-hook ()
  (define-key ediff-mode-map "q" 'my-ediff-quit))

; Replace the default q binding so that a quit doesn't need confirmation
(add-hook 'ediff-keymap-setup-hook 'my-ediff-keymap-setup-hook)

; Delete ediff files associated with the ediff
(add-hook 'ediff-quit-hook 'ediff-cleanup-mess)

; Don't ask user, just delete the buffers used for the diff
(add-hook 'ediff-cleanup-hook (lambda () (ediff-janitor nil nil)))
