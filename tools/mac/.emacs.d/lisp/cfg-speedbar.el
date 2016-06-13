(require 'speedbar)
(speedbar-add-supported-extension ".hs")
(speedbar-add-supported-extension ".lhs")
(speedbar-add-supported-extension ".hsc")

;; File navigation through sr-speebar
;; NOTE: typing 'g' while in the sr-speedbar will refresh the files/directories that show
(require-package 'sr-speedbar)
(setq speedbar-show-unknown-files t) ; show all files
(setq speedbar-use-images nil) ; use text for buttons
(setq sr-speedbar-right-side nil) ; put on left side
(global-set-key (kbd "C-c n") 'sr-speedbar-toggle)
