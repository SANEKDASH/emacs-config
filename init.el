(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e9d47d6d41e42a8313c81995a60b2af6588e9f01a1cf19ca42669a7ffd5c2fde" default))
 '(package-selected-packages
   '(markdown-mode company-lsp lsp-ui lsp-mode company cyberpunk-theme)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; Cyberpunk theme.
(use-package cyberpunk-theme
  :ensure t
  :config
  (load-theme 'cyberpunk 1))


;; Enabling IDO mode.
(ido-mode 1)


;; Tabulation is 4 spaces.
(setq-default tab-width 4)


;; Autocompletion.
(use-package company
  :ensure t
  :config
  (global-company-mode 1))
(setq company-minimum-prefix-length 2)


;; Disabling scroll bar.
(scroll-bar-mode 0)


;; Enable line numbers.
(global-display-line-numbers-mode)
(set-face-attribute 'line-number nil
                    :background "#2b2b2b"
                    :foreground "#497df1")

(set-face-attribute 'line-number-current-line nil
                    :background "#4A4A4A"
                    :foreground "#FFFFFF")


;; Disabling stuff in the top of the screen
(tool-bar-mode 0)
(menu-bar-mode 0)


;; Scroll margin
(setq scroll-margin 10)
(setq scroll-conservatively 101)


(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t     ; Don't delink hardlinks
      version-control t       ; Use version numbers on backups
      delete-old-versions t   ; Automatically delete excess backups
      kept-new-versions 20    ; how many of the newest versions to keep
      kept-old-versions 5)    ; and how many of the old


;; Keybind to switch windows
(global-set-key (kbd "M-o") 'other-window)

;; Disable fucking ring bell
(setq ring-bell-function 'ignore)


;; Disable line truncate
(setq-default truncate-lines t)
