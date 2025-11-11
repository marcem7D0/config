;; Marcell Mittnacht (Github: marcem7D0) Emacs config

(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)
(setq visible-bell nil)
(setq ring-bell-function #'ignore)
(setq make-backup-files nil)
(setq scroll-margin 15)

(setq read-process-output-max (* 1024 1024))

(add-hook 'emacs-startup-hook #'config/reset-gc-settings)

(defun config/reset-gc-settings ()
  "Restore GC settings from 200 MB to 50 MB."
  (setq gc-cons-tthreshold (* 1024 1024 50)))

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (load-theme 'sanityinc-tomorrow-night))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashbaord-center-content t)
  (setq dashboard-vertically-center-content t))

(use-package page-break-lines
  :ensure t)

(use-package all-the-icons
  :ensure t)

(use-package nerd-icons
  :ensure t)

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-mode +1)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (eq system-type 'windows-nt)
    (setq projectile-project-search-path '("D:/Projects")))
  (setq dashboard-icon-type 'all-the-icons)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t))

(use-package tree-sitter-langs
  :ensure t)

(use-package flymake
  :hook (after-init . global-flymake-mode))

(use-package eglot
  :hook (prog-mode . eglot-ensure))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package mood-line
  :ensure t
  :config
  (mood-line-mode))

(use-package go-mode
  :ensure t)
