;;; rebalance windows on split and delete
(defadvice split-window-vertically (after rebalance-h nil activate)
"Calls `balance-windows' after splitting a window with C-x 2."
(when (called-interactively-p 'any)
(balance-windows)))

(defadvice delete-window (after rebalance-d nil activate)
"Calls `balance-windows' after deleting a window with C-x 0."
(when (called-interactively-p 'any)
(balance-windows)))

;;; Split horizontally when compiling.
(setq split-height-threshold nil)
(setq split-width-threshold 0)

; set the frame title to filename (path)
(setq-default frame-title-format "%b (%f)")

;;; Enable line numbers on the left side:
(global-linum-mode t)

;;; Font-size:
(set-face-attribute 'default nil :height 140)

;;; Autocomplete
;;;(global-auto-complete-mode t)
;; damn
;;; Disable startup message
;;; (setq inhibit-startup-message t)
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (let ((mode (if (display-graphic-p frame)
                            'light 'dark)))
              (set-frame-parameter frame
                                   'background-mode
                                   mode)
              (set-terminal-parameter
               frame
               'background-mode
               mode))
            (enable-theme 'solarized)))

(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)

;;; Adding themes:
(add-to-list 'custom-theme-load-path "~/.emacs.d/personal/themes/")
;;; Solarized
(load-theme 'solarized t)

;;; Turn off all bars
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;;; Highlight 80 character column.
(require 'fill-column-indicator)
;; only in c++ mode.
(add-hook 'c++-mode-hook 'fci-mode)

(defadvice vc-git-mode-line-string (after plus-minus (file) compile activate)
  (setq ad-return-value
	(concat ad-return-value
		(let ((plus-minus (vc-git--run-command-string
				   file "diff" "--numstat" "--")))
		  (and plus-minus
		       (string-match "^\\([0-9]+\\)\t\\([0-9]+\\)\t" plus-minus)
		       (format " +%s-%s" (match-string 1 plus-minus) (match-string 2 plus-minus)))))))
