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

(set-frame-font "Iosevka 13")

(setq read-process-output-max (* 1024 1024))

(add-hook 'emacs-startup-hook #'config/reset-gc-settings)

(defun config/reset-gc-settings ()
  "Restore GC settings from 200 MB to 50 MB."
  (setq gc-cons-tthreshold (* 1024 1024 50)))

(use-package which-key
  :config
  (which-key-mode))

(use-package nord-theme
  :ensure t
  :config
  (load-theme 'nord))

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

(use-package ripgrep
  :ensure t)

(use-package tree-sitter-langs
  :ensure t)

(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode))

(use-package flymake
  :hook (after-init . global-flymake-mode))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package mood-line
  :ensure t
  :config
  (mood-line-mode))

(use-package go-mode
  :ensure t
  :hook ((go-mode . eglot-ensure)
	 (before-save . (lambda ()
			  (add-hook 'before-save-hook #'gofmt-before-save nil t))))
  :config
  (setq eglot-workspace-configuration
	'((:gopls . ((staticcheck . t)
		     (usePlaceholders . t)
		     (completeUnimported . t))))))

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode))

;; Enable Vertico for completion UI
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;; Add Consult for enhanced commands (search, buffer switching, etc.)
(use-package consult
  :ensure t
  :bind (("C-s" . consult-line)            ;; search in buffer
         ("C-x b" . consult-buffer)        ;; switch buffer
         ("M-y" . consult-yank-pop)        ;; show kill-ring
         ("C-c r" . consult-ripgrep)       ;; project search
         ("C-c f" . consult-find)))        ;; find files

(use-package consult-dir
  :ensure t
  :bind ("C-x d" . consult-dir))

;; Embark adds context-sensitive actions
(use-package embark
  :ensure t
  :bind (("C-." . embark-act)         ;; act on thing at point
         ("C-;" . embark-dwim))       ;; smart default action
  :init
  ;; Show Embark actions in a helpful completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command))

;; Embark-Consult integration: previews in Consult buffers
(use-package embark-consult
  :ensure t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package emacs
  :custom
  (tab-always-indent 'complete)
  (text-mode-ispell-word-completion nil)
  (read-extended-command-predicate #'command-completion-default-include-p))

(add-hook 'eshell-mode-hook
	  (lambda ()
	    (display-line-numbers-mode -1)))

(global-set-key (kbd "C-c t") 'eshell)
(global-set-key (kbd "C-x p") 'my/move-back-window)
(global-set-key (kbd "C-x 2") 'split-window-right)
(global-set-key (kbd "C-x 3") 'split-window-below)

(defun my/move-back-window ()
  (interactive)
  (other-window -1))
