;; Allow find to work on windows
(defadvice shell-quote-argument (after windows-nt-special-quote (argument) activate)
     "Add special quotes to ARGUMENT in case the system type is 'windows-nt."
     (when
         (and (eq system-type 'windows-nt) (w32-shell-dos-semantics))
       (if (string-match "[\\.~]" ad-return-value)
           (setq ad-return-value
               (replace-regexp-in-string
                "\\([\\.~]\\)"
                "\\\\\\1"
                ad-return-value)))))
