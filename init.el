(setq custom-file (make-temp-file "emacs-custom"))
(setq make-backup-files nil)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(tool-bar-mode -1)
(scroll-bar-mode -1)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(use-package nordic-night-theme
  :ensure t
  :config
  (load-theme 'nordic-night t))
