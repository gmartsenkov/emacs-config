(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil which-key use-package general)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq delete-old-versions -1 )		; delete excess backup versions silently
(setq version-control t )		; use version control
(setq vc-make-backup-files t )		; make backups file even when in version controlled dir
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) ) ; which directory to put backups file
(setq vc-follow-symlinks t )				       ; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ) ;transform backups file name
(setq inhibit-startup-screen t )	; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore )	; silent bell when you make a mistake
(setq coding-system-for-read 'utf-8 )	; use utf-8 by default
(setq coding-system-for-write 'utf-8 )
(setq sentence-end-double-space nil)	; sentence SHOULD end with only a point.
(setq default-fill-column 80)		; toggle wrapping text at the 80th character
(setq initial-scratch-message "Welcome in Emacs") ; print a default message in the empty scratch buffer opened at startup

(require 'package)
(setq package-enable-at-startup nil) ; tells emacs not to load any packages before starting up
;; the following lines tell emacs where on the internet to look up
;; for new packages.
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package) ; unless it is already installed
  (package-refresh-contents) ; updage packages archive
  (package-install 'use-package)) ; and install the most recent version of use-package

(require 'use-package) ; guess what this one does too ?
(use-package general :ensure t
  :config
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"

    "f" '(:ignore t :which-key "Files")
    "p" '(:ignore t :which-key "Projects")
    "g" '(:ignore t :which-key "Git")
    "t" '(:ignore t :which-key "Toggles")
    ))

(use-package company :ensure t)
(use-package git :ensure t)
(use-package magit :ensure t)
(use-package diff-hl :ensure t)
(use-package nlinum :ensure t)
(use-package which-key :ensure t)
(use-package evil :ensure t)
(use-package evil-leader :ensure t)
(use-package ivy :ensure t)
(use-package projectile :ensure t)

;; RUBY
(use-package enh-ruby-mode :ensure t)
(use-package ruby-end :ensure t)
;; ELIXIR
(use-package elixir-mode :ensure t)
(use-package alchemist :ensure t)
(use-package dracula-theme :ensure t)

(setq nlinum-format "%d ")
(setq projectile-completion-system 'ivy)
(global-nlinum-mode t)
(load-theme 'dracula t)
(add-hook 'after-init-hook 'global-company-mode)
(projectile-mode +1)
(global-evil-leader-mode)
(evil-leader/set-leader "SPC")
(evil-mode 1)
(ivy-mode 1)
(which-key-mode)

(use-package evil-magit :ensure t)

(global-diff-hl-mode t)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
(setq magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1)
(setq which-key-idle-delay 0)
(define-key ivy-minibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit)
(evil-leader/set-key
  "TAB" 'switch-to-buffer-preserve-window-point
  "ff" 'find-file
  "b" 'switch-to-buffer
  "pp" 'projectile-switch-project
  "pf" 'projectile-find-file
  "tl" 'nlinum-mode
  "gs" 'magit-status
  "k" 'kill-buffer)
