;; Setup package.el
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil-magit evil which-key use-package general)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(set-face-attribute 'default nil
                    :family "Office Code Pro"
                    :height 110
                    :weight 'normal
                    :width 'normal) 

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
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
(setq default-fill-column 80)		; toggle wrapping te(setq package-enable-at-startup nil) ; tells emacs not to load any packages before starting up
;; the following lines tell emacs where on the internet to look up
;; for new packages.
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))


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

(use-package exec-path-from-shell :ensure t)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(use-package company :ensure t)
(use-package git :ensure t)
(use-package magit :ensure t)
(use-package git-gutter :ensure t)
(use-package which-key :ensure t)
(use-package evil :ensure t)
(use-package evil-leader :ensure t)
(use-package ivy :ensure t)
(use-package projectile :ensure t)
(use-package telephone-line :ensure t)
(use-package ace-window :ensure t)
(use-package golden-ratio :ensure t)
(use-package flycheck :ensure t)

;; RUBY
(use-package ruby-end :ensure t)
(use-package rspec-mode :ensure t)
(setq ruby-indent-level 2)

;; GO
(use-package go-mode :ensure t)
(use-package company-go :ensure t)
(setq company-tooltip-limit 10) 
(setq company-idle-delay .1) 
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-hook 'go-mode-hook (lambda ()
			  (setq tab-width 4)
		          (setq indent-tabs-mode 1)
			  (setq indent-tabs-mode 1)
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))


(add-hook 'ruby-mode-hook
  (function (lambda ()
          (setq evil-shift-width ruby-indent-level))))

;; ELIXIR
(use-package elixir-mode :ensure t)
(use-package alchemist :ensure t)
(use-package dracula-theme :ensure t)

;; RUST
(use-package rust-mode :ensure t)
(use-package flycheck-rust :ensure t)
(use-package racer :ensure t)
(setq rust-format-on-save t)
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

;; OTHER
(global-display-line-numbers-mode t)
(setq projectile-completion-system 'ivy)

(setq telephone-line-primary-left-separator 'telephone-line-cubed-left
      telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
      telephone-line-primary-right-separator 'telephone-line-cubed-right
      telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)
(setq telephone-line-evil-use-short-tag t)

(set-face-attribute 'telephone-line-evil-normal
                    nil
                    :background
                    "#bd93f9")
(set-face-attribute 'telephone-line-evil-insert
                    nil
                    :background
                    "#50fa7b")
(set-face-attribute 'telephone-line-evil-visual
                    nil
                    :background
                    "#ffb86c")

(load-theme 'dracula t)
(add-hook 'after-init-hook 'global-company-mode)
(projectile-mode +1)
(global-flycheck-mode)
(global-evil-leader-mode)
(evil-leader/set-leader "SPC")
(evil-mode 1)
(ivy-mode 1)
(which-key-mode)
(telephone-line-mode 1)
(golden-ratio-mode 1)

(use-package evil-magit :ensure t)

(global-git-gutter-mode t)

(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(add-to-list 'golden-ratio-extra-commands 'ace-window)
(setq magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1)
(setq which-key-idle-delay 0)
(setq auto-revert-check-vc-info t)
(define-key ivy-minibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit)
(evil-leader/set-key
  "." 'split-window-vertically
  "," 'split-window-horizontally
  "TAB" 'switch-to-previous-buffer
  "ff" 'find-file
  "b" 'switch-to-buffer
  "k" 'ace-delete-window
  "w" 'ace-window
  "pp" 'projectile-switch-project
  "pf" 'projectile-find-file
  "tl" 'global-display-line-numbers-mode
  "gs" 'magit-status
  "s" 'rspec-toggle-spec-and-target
)

