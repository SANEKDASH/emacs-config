(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Disable splash screen
(setq inhibit-startup-screen 1)

;; Enabling IDO mode.
(ido-mode 1)

;; Tabulation is 4 spaces.
(setq-default tab-width 4)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes '(wheatgrass))
 '(ispell-dictionary nil)
 '(package-selected-packages '(company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; use hunspell as a spell checker
(setq ispell-program-name "hunspell")
(setq ispell-dictionary "ru_RU") 

;; use flyspell in text mode
(add-hook 'text-mode-hook #'flyspell-mode)
(add-hook 'org-mode-hook  #'flyspell-mode)
(add-hook 'latex-mode-hook #'flyspell-mode)


;; mind M-t to swicth between english and russian dictionaries
(defun my-flyspell-toggle-dictionary ()
  (interactive)
  (if (string= ispell-current-dictionary "ru_RU")
      (ispell-change-dictionary "en_US")
    (ispell-change-dictionary "ru_RU")))
(global-set-key (kbd "M-t") 'my-flyspell-toggle-dictionary)
