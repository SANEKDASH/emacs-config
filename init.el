;; ========
;; PACKAGES
;; ========

(setq package-archives'
      (
       ("melpa"     . "https://melpa.org/packages/")
       ("org"       . "http://orgmode.org/elpa/")
       ("gnu"       . "http://elpa.gnu.org/packages/")
       )
      )

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(unless package-archive-contents
  (package-refresh-contents))

(use-package paredit
  :ensure t
  :hook ((emacs-lisp-mode lisp-mode) . enable-paredit-mode))

(use-package company
  :ensure t
  :config (global-company-mode 1))

(use-package elpy
  :ensure t
  :init
  (advice-add 'python-mode :before (lambda (&rest _) (elpy-enable)))
  :config
  (elpy-enable)
  (setq python-shell-interpreter "/home/alexdash/.local/bin/ipython"
	python-shell-interpreter-args "-i --simple-prompt")
  )

;; ======
;; EDITOR
;; ======

;; Disable backup files creation
(setq make-backup-files nil)

;; Disable autosave
(setq auto-save-default nil)

;; Default encoding - utf-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; Enable line numbers.
(global-display-line-numbers-mode)
(set-face-attribute 'line-number nil
                    :background "#2b2b2b"
                    :foreground "#497df1")

(set-face-attribute 'line-number-current-line nil
                    :background "#4A4A4A"
                    :foreground "#FFFFFF")

;; Disabling stuff at the top of the screen
(tool-bar-mode 0)
(menu-bar-mode 0)

;; Disabling scroll bar.
(scroll-bar-mode 0)

;; Disable splash screen
(setq inhibit-startup-screen 1)

;; Enable visible bell
(setq visible-bell t)

;; Completely ignore the bell function
(setq ring-bell-function 'ignore)

;; Enabling IDO mode.
(ido-mode 1)

;; Options for C files
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq c-basic-offset 8)
            (setq indent-tabs-mode t)
            (setq tab-width 8)
	    ))

;; Scroll margin
(setq scroll-margin 10)
(setq scroll-conservatively 101)

;; Keybind to switch windows
(global-set-key (kbd "M-o") 'other-window)

;; Disable line truncate
(setq-default truncate-lines t)

;; =============
;; SPELL CHECKER
;; =============

;; Use hunspell for spell checking.
(setq ispell-program-name "/usr/bin/hunspell")
;; Use english dictionary by default
(setq ispell-dictionary "en_A")
(defun add-flyspell-hook (&rest modes)
  (mapc (lambda (mode)
	  (add-hook mode 'flyspell-mode)
	  )
	modes
	)
  )

;; Add flyspell hooks to different
;; text editing modes.
(add-flyspell-hook
 'text-mode-hook
 'markdown-mode-hook
 'org-mode-hook
 'git-commit-mode-hook
 'c-mode-common-hook
 )

;; Delete trailing spaces after saving.
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
