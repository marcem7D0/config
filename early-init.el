;; Set GC for performance
(setq gc-cons-threshold (* 1024 1024 200)) ;; 200 MB

(setq custom-safe-themes t)

;; Add Melpa
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil))

(setq font-lock-support-mode 'jit-lock-mode)

;; Set custom-file location
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)
