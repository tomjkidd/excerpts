;; Started this by following along with...
;; http://cestlaz.github.io/posts/using-emacs-1-setup/#.WX0dGtPyto4
;; It has evolved to include other things I commonly use

;; Basic Editor Config
;; ===================

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(tool-bar-mode -1)
(global-linum-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
;; https://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq-default indent-tabs-mode nil)
(blink-cursor-mode -1)
(global-prettify-symbols-mode -1)
(global-hl-line-mode +1)
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(show-paren-mode)
(setq electric-indent-mode nil)
;; %b - buffername | %f - filepath
(setq-default frame-title-format "%b")

; C-h v whitespace-style
(global-whitespace-mode 1)
(setq whitespace-style '(face trailing spaces empty indentation::space space-before-tab space-before-tab::tab space-mark))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Window Keys
;; ===========

;; Move between visible buffers
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "M-s-<up>") 'windmove-up)
(global-set-key (kbd "M-s-<down>") 'windmove-down)
(global-set-key (kbd "M-s-<left>") 'windmove-left)
(global-set-key (kbd "M-s-<right>") 'windmove-right)
(global-set-key (kbd "s-w") 'delete-window)

(global-set-key (kbd "M-s-^") 'windmove-up)   ;; M-s-i
(global-set-key (kbd "M-s-˚") 'windmove-down) ;; M-s-k
(global-set-key (kbd "M-s-∆") 'windmove-left) ;; M-s-j
(global-set-key (kbd "M-s-¬") 'windmove-right);; M-s-l

;; Unbind the window minimizing behavior (suspend-frame)
(global-unset-key (kbd "C-z"))

;; Package Setup
;; =============

(require 'package)
;; Disables automatic package loading, see `Packaging Basics`
(setq package-enable-at-startup nil)
;; see `Creating and Maintaining Package Archives`
;; Form is (<id> . <location>)
;; <id> and <location> are strings, <location> can be an http link or dir
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;; See `Packaging Basics`
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Emacs tutorial packages
;; =======================

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package ace-window
  :ensure t
  :init
  ;; When lots of windows open, use number keys to nav
  (global-set-key [remap other-window] 'ace-window)
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 2.0))))))

;; ido - interactively do
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(defalias 'list-buffers 'ibuffer)

;; window management...
(winner-mode -1)
(windmove-default-keybindings)

(use-package ivy-hydra
  :ensure t)

(use-package counsel
  :ensure t)

(use-package swiper
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-wrap t)
  (setq ivy-height 10)
  (setq ivy-use-virtual-buffers t)
  (setq confirm-nonexistent-file-or-buffer t)
  (setq ivy-extra-directories nil)
  (setq enable-recursive-minibuffers t)
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history))

(use-package avy
  :ensure t
  ;; avy-goto-char maps every occurence of a typed char to a series of keys.
  ;; Typing the matching series will nav to a specific area in the visible buffer.
  ;; In a clojure file, `M-s (` is useful to get to the start of a visible form
  :bind ("M-s" . avy-goto-word-1))

(use-package auto-complete
  :ensure t
  :init
  ;; Will do auto-complete based on words already in the buffer
  ;; M-n and M-p move through auto-complete options
  ;; C-i and C-m to move through and select
  (ac-config-default)
  (global-auto-complete-mode t))

;; To use org-mode to condense a large config file...
;; In org mode type <s-<Tab> and add a emacs-lisp line, then put list in the
;; block that gets created.
;; This is overkill for what I'm up to at the moment...
;;(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;; Theme Packages
;; ==============

(use-package powerline
  :ensure t)

(use-package moe-theme
  :ensure t
  :config
  (require 'powerline)
  ;(moe-dark) ;; I don't like how this affects switcher
  (moe-theme-set-color 'yellow)
  (powerline-moe-theme))

(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t)
  (setq monokai-height-minus-1 0.8
	  monokai-height-plus-1 1.1
	  monokai-height-plus-2 1.15
	  monokai-height-plus-3 1.2
	  monokai-height-plus-4 1.5))

(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

;; Editor Packages
;; ===============

(use-package smex
  :ensure t
  :config
  (setq smex-save-file (concat user-emacs-directory ".smex-items"))
  (smex-initialize)
  (global-set-key (kbd "M-z") 'smex))

(use-package recentf
  :ensure t
  :config
  (recentf-mode 1)
  (setq recentf-save-file (concat user-emacs-directory ".recentf"))
  (setq recentf-max-menu-items 40)
  (defun ido-choose-from-recentf ()
    "Use ido to select a recently visited file from the `recentf-list'"
    (interactive)
    (find-file (ido-completing-read "Open file: " recentf-list nil t)))

  ;; bind it to "C-c f"
  (global-set-key (kbd "C-c f") 'ido-choose-from-recentf))

(use-package saveplace
  :ensure t
  :config
  (setq-default save-place t)
  (setq save-place-file (concat user-emacs-directory "places"))
  (setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                 "backups"))))
  (setq auto-save-default  nil))

(global-set-key (kbd "M-/") 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-list-symbol))

(use-package speedbar
  :ensure t)

(use-package sr-speedbar
  :ensure t
  :config
  (setq speedbar-show-unknown-files t)
  (setq speedbar-use-images nil)
  (setq sr-speedbar-right-side nil)
  (global-set-key (kbd "C-c n") 'sr-speedbar-toggle))

;; TODO: checkout ido-ubiquitous package

;; Clojure Packages
;; ================

(use-package paredit
  :ensure t
  :config
  (add-hook 'lisp-mode-hook #'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
  (add-hook 'clojure-mode-hook #'paredit-mode)
  (add-hook 'cider-repl-mode-hook #'paredit-mode))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package clojure-mode
  :ensure t)

(use-package cider
  :ensure t)

(use-package magit
  :ensure t
  :config
  ;; The following keybinding brings you to a git status window
  ;; From there s/u can be used to state/unstage
  ;; l can be used to show log
  ;; c can be used to commit
  ;; d can be used to diff
  ;; h can be used to create branches
  (global-set-key (kbd "C-x g") 'magit-status))
