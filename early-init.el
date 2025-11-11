;; Set GC for performance
(setq gc-cons-threshold (* 1024 1024 200)) ;; 200 MB

;; Add Melpa
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;; Set font
(set-frame-font "Iosevka NF 11")

;; Set custom-file location
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)
