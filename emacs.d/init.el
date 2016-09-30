;;;; Adel's .emacs file
;; Mhd Adel Al Qodmani
;; August 2016

(add-to-list 'load-path "~/.emacs.d/personal/")
(if (file-exists-p  "~/.emacs.d/work.el")
    (load "~/.emacs.d/work"))
(load "~/.emacs.d/personal/personal_init.el")
(load "~/.emacs.d/personal/key_bindings")
(load "~/.emacs.d/personal/appearance")
(load "~/.emacs.d/personal/edit_helpers")
(load "~/.emacs.d/personal/golang_helpers")
