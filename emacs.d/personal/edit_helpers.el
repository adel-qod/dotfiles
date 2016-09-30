;;; Enable electric pair mode when in C/C++/Lisp/HTML to match ()
;;  works with Emacs 24.1 and higher.
(add-hook 'c++-mode-hook (lambda  () (electric-pair-mode 1)))
(add-hook 'emacs-lisp-hook (lambda () (electric-pair-mode 1)))
(add-hook 'java-mode-hook (lambda () (electric-pair-mode 1)))
(add-hook 'html-mode-hook (lambda () (electric-pair-mode 1)))
(add-hook 'go-mode-hook (lambda () (electric-pair-mode 1)))

;; remove trailing white spaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; Columns, rows, indents and cursor
;;;
;; Set standard indent to 2 instead of default 4
(setq standard-indent 2)
;; Mention column number
(setq column-number-mode t)
;; Mention line number
(setq line-number-mode t)
;; Line by line scrolling, instead of jumping the cursor to the middle of the
;; screen when scrolling
(setq scroll-step 1)

;; Set fill column to be at 80 for some languages.
(add-hook 'c++-mode-hook '(lambda() (turn-on-auto-fill) (set-fill-column 80)))
(add-hook 'c-mode-hook '(lambda() (turn-on-auto-fill) (set-fill-column 80)))
;; Auto indent with RET as well as C-j
(define-key global-map (kbd "RET") 'newline-and-indent)

;;; Highlighting and search related:
;; Highlight parenthesis with 0 delay:
(show-paren-mode t)
(setq-default show-paren-delay 0)
;; Highlight misspelled words.
(add-hook 'text-mode-hook (lambda  () (flyspell-mode 1)))

;; Remember cursor position on close.
(setq save-place-file "~/.emacs.d/personal/saveplace") ;; keep my ~/ clean
(setq-default save-place t)                   ;; activate it for all buffers
(require 'saveplace)                          ;; get the package
