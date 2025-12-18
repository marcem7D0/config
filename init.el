(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none))

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)
(setq create-lockfiles nil)

(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode t)
(setq-default truncate-lines t)
(setq display-line-numbers-type 'relative)
(setq visible-bell nil)
(setq ring-bell-function #'ignore)
(setq make-backup-files nil)
(setq scroll-margin 15)

(set-frame-font "Iosevka 13" nil t)

(setq read-process-output-max (* 1024 1024))

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(use-package which-key
  :config
  (which-key-mode))

(use-package naysayer-theme
  :ensure t
  :config
  (load-theme 'naysayer))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashbaord-center-content t)
  (setq dashboard-vertically-center-content t))

(use-package move-text
  :ensure t
  :bind (("M-<up>" . move-text-up)
	 ("M-<down>" . move-text-down)))

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
  (setq dashboard-icon-type 'all-the-icons)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t))

(use-package ripgrep
  :ensure t)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-traditional))

(use-package mood-line
  :ensure t
  :config
  (mood-line-mode))

(use-package go-mode
  :ensure t
  :hook ((go-mode . eglot-ensure)
	 (go-mode . (lambda()
		      (add-hook 'before-save-hook #'gofmt-before-save nil t)))))

(use-package copilot-chat
  :ensure t
  :config
  (add-to-list 'display-buffer-alist
             '("\\*copilot-chat\\*"
               (display-buffer-in-side-window)
               (side . right)
               (slot . 0)
               (window-width . 0.4))))

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

(use-package eglot
  :bind
  (("C-x r" . eglot-rename)
   ("C-x a" . eglot-code-actions))
  :config
  (setq eglot-autoshutdown t)
  (setq eglot-sync-connect nil))

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
  :bind (("C-x b" . consult-buffer)        ;; switch buffer
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
(global-set-key (kbd "C-c C-c") 'copilot-chat-display)

(defun my/move-back-window ()
  (interactive)
  (other-window -1))
