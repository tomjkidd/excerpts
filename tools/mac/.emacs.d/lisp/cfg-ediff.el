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

;; disable vc-git so that emacs ediff will work
(setq vc-handled-backends ())

;; Github light green #EAFFEA
;; Github dark green #A6F3A6
;; Github light red #FFECEC
;; Github dark red #F8CBCB

;; Monokai red #6f8e6f, #5F1515 (best so far), #260001
;; Monokai green #9b4d4d, #304C30 (best so far), #001C14

;; Terminal red #260001, green #000A00

;; Use diff colors that are readable with monokai theme
;; Backup for simple known working state.
(add-hook 'ediff-load-hook
  (lambda ()
;; Current diff
(custom-set-faces '(ediff-current-diff-A
             ((((type tty)) :background "gray15")
               (t :background "#353535"))))
(custom-set-faces '(ediff-current-diff-Ancestor
             ((((type tty)) :background "gray15")
               (t :background "#353535"))))
(custom-set-faces '(ediff-current-diff-B
             ((((type tty)) :background "gray15")
               (t :background "#353535"))))
(custom-set-faces '(ediff-current-diff-C
             ((((type tty)) :background "gray15")
               (t :background "#353535"))))

;; Even
(custom-set-faces '(ediff-even-diff-A
                    ((((type tty)) (:foreground "Black" :background "gray15"))
                     (t (:foreground "Black" :background "gray15")))))
(custom-set-faces '(ediff-even-diff-Ancestor
                    ((((type tty)) (:foreground "Black" :background "gray15"))
                     (t (:foreground "Black" :background "gray15")))))
(custom-set-faces '(ediff-even-diff-B
                    ((((type tty)) (:foreground "Black" :background "gray15"))
                     (t (:foreground "Black" :background "gray15")))))
(custom-set-faces '(ediff-even-diff-C
                    ((((type tty)) (:foreground "Black" :background "gray15"))
                     (t (:foreground "Black" :background "gray15")))))

;; Odd
(custom-set-faces '(ediff-odd-diff-A
                    ((((type tty)) (:foreground "Black" :background "gray15"))
                     (t (:foreground "Black" :background "gray15")))))
(custom-set-faces '(ediff-odd-diff-Ancestor
                    ((((type tty)) (:foreground "Black" :background "gray15"))
                     (t (:foreground "Black" :background "gray15")))))
(custom-set-faces '(ediff-odd-diff-B
                    ((((type tty)) (:foreground "Black" :background "gray15"))
                     (t (:foreground "Black" :background "gray15")))))
(custom-set-faces '(ediff-odd-diff-C
                    ((((type tty)) (:foreground "Black" :background "gray15"))
                     (t (:foreground "Black" :background "gray15")))))

;; Fine diff
(custom-set-faces '(ediff-fine-diff-A
             ((((type tty)) :background "#260001")
               (t :background "#6F002D"))))
(custom-set-faces '(ediff-fine-diff-Ancestor
             ((((type tty)) :background "#222222")
               (t :background "#222222"))))
(custom-set-faces '(ediff-fine-diff-B
             ((((type tty)) :background "#000A00")
               (t :background "#539600"))))
(custom-set-faces '(ediff-fine-diff-C
             ((((type tty)) :background "#222222")
               (t :background "#222222"))))
))

