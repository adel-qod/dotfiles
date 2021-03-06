;; To install the mode; just run M-x package-install go-mode and go-autocomplete.
;; You'll see need to run at least these:
;; go get golang.org/x/tools/cmd/...
;; go get -u github.com/nsf/gocode

(add-to-list 'exec-path "/home/mpcadel/src/go/bin/")

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
(setq ac-modes '(go-mode emacs-lisp-mode))

;; auto-complete somehow overrides this for go.
(electric-pair-mode t)

(defun my-go-mode-hook ()
; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
	   "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)
