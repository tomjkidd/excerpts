;; quiet, please! No dinging!
(setq visible-bell nil)
(setq ring-bell-function (lambda () nil))

;; Maximize the editor
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode -1)

;; Show line numbers
(global-linum-mode)
(setq column-number-mode t)
;; You can uncomment this to remove the graphical toolbar at the top. After
;; awhile, you won't need the toolbar.
(when (fboundp 'tool-bar-mode)
   (tool-bar-mode -1))

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; Highlights matching parenthesis
(show-paren-mode 1)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; Convenience for buffer management. C-c RIGHT/LEFT
(winner-mode t)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; yay rainbows!
(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Helpful display of available command for what you've chorded so far
(require-package 'which-key)
(which-key-mode)

;; Highlight current line
;;(global-hl-line-mode 1)

;; full path in title bar
;;(setq-default frame-title-format "%b (%f)")

(setq electric-indent-mode nil)

;; Unbind the window minimizing behavior (suspend-frame)
(global-unset-key (kbd "C-z"))

; Faces are responsible for colors and fonts, this will identify the one being
; used at the current cursor position.y
(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

; CODE FOLDING
(add-hook 'prog-mode-hook 'hs-minor-mode)
(global-set-key (kbd "s-<up>") 'hs-hide-level)
(global-set-key (kbd "s-<left>") 'hs-toggle-hiding)
(global-set-key (kbd "s-<right>") 'hs-toggle-hiding)
(global-set-key (kbd "s-<down>") 'hs-show-all)
