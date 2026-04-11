(setq custom-file (make-temp-file "emacs-custom"))
(setq make-backup-files nil)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(setq ring-bell-function 'ignore)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(which-key-mode 1)
(global-display-line-numbers-mode 1)

(set-frame-font "FiraCode Nerd Font 12" nil t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(use-package nordic-night-theme
  :ensure t
  :config
  (load-theme 'nordic-night t))

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

(use-package vertico
  :ensure t
  :custom
  (vertico-count 10)
  (vertico-resize t)
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package consult
  :ensure t
  :bind (
	 ("C-x b" . consult-buffer)
	 ("C-s" . consult-ripgrep)
	 ("C-c d" . consult-flymake)
	 ("C-c i" . consult-imenu)
	 ("M-g g" . consult-goto-line))
  :init
  (advice-add #'register-preview :override #'consult-register-window)
  (setq register-preview-delay 0.5)
  (setq xref-show-xrefs-function #'consult-xref
	xref-show-definitions-function #'consult-xref))

(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode))

(use-package rust-mode
  :ensure t
  :hook(rust-mode . (lambda() (setq indent-tabs-mode nil))))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

(use-package eglot
  :defer t
  :hook ((python-ts-mode . eglot-ensure)
	 (rust-ts-mode . eglot-ensure)))

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode))

(use-package nerd-icons-corfu
  :ensure t
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

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
