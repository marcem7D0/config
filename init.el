(setq custom-file (make-temp-file "emacs-custom"))
(setq make-backup-files nil)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(setq ring-bell-function 'ignore)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(which-key-mode 1)
(global-display-line-numbers-mode 1)
(global-auto-revert-mode 1)

(set-frame-font "JetbrainsMono Nerd Font 12" nil t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(use-package exec-path-from-shell
  :ensure t)

(use-package spacemacs-theme
  :ensure t
  :config
  (load-theme 'spacemacs-dark t))

(use-package all-the-icons
  :ensure t)

(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package vterm
  :ensure t)

(use-package ripgrep
  :ensure t)

(use-package magit
  :ensure t)

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind
  (:map projectile-mode-map
	("C-c p" . projectile-command-map)))

(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode))

(use-package corfu
  :ensure t
  :config
  (global-corfu-mode 1))

(use-package go-mode
  :ensure t)

(use-package go-ts-mode
  :hook ((go-ts-mode . eglot-ensure)
	 (go-ts-mode . (lambda()
			 (add-hook 'before-save-hook #'gofmt nil t))))
  :config
  (setq tab-width 4))  

(use-package eglot
  :bind
  (("C-x a" . eglot-code-actions)))

(use-package emacs
  :custom
  (tab-always-indent 'complete)
  (text-mode-ispell-word-completion nil)
  (context-menu-mode t)
  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

(keymap-global-set "C-x 2" 'my-split-window-and-switch)
(keymap-global-set "C-x 3" 'my-split-window-below-and-switch)
(keymap-global-set "C-x p" 'my-other-window-backwards)
(keymap-global-set "C-c t" 'my-open-vterm-split-window)
(keymap-global-set "C-c C-k" 'comment-line)
(keymap-global-set "C-x 9" 'shell-command)

(add-hook 'vterm-mode-hook (lambda () (display-line-numbers-mode -1)))

(defun my-other-window-backwards ()
  (interactive)
  (other-window -1))

(defun my-split-window-and-switch ()
  (interactive)
  (split-window-right)
  (other-window 1))

(defun my-split-window-below-and-switch ()
  (interactive)
  (split-window-below)
  (other-window 1))

(defun my-open-vterm-split-window ()
  (interactive)
  (my-split-window-and-switch)
  (vterm))
