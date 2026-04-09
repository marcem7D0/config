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

(use-package vterm
  :ensure t)

(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode))

(use-package rust-mode
  :ensure t
  :hook(rust-mode . (lambda() (setq indent-tabs-mode nil))))

(keymap-global-set "C-x 2" 'my-split-window-and-switch)
(keymap-global-set "C-x p" 'my-other-window-backwards)
(keymap-global-set "C-c t" 'my-open-vterm-split-window)

(defun my-other-window-backwards ()
  (interactive)
  (other-window -1))

(defun my-split-window-and-switch ()
  (interactive)
  (split-window-right)
  (other-window 1))

(defun my-open-vterm-split-window ()
  (interactive)
  (my-split-window-and-switch)
  (vterm))
