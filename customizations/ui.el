(global-set-key (kbd "C-c l") 'global-display-line-numbers-mode)

(menu-bar-mode 0)

;; hide toolbar
(tool-bar-mode -1)

;; hide scroll bar
(scroll-bar-mode -1)

;; No cursor blinking, it sucks
(blink-cursor-mode 0)

(display-battery-mode 1)

(setq-default cursor-type 'bar)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; no bell
(setq ring-bell-function 'ignore)

;; doom themes
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-city-lights t))

;; icons
(use-package nerd-icons
  :ensure t)

;;doom modeline
(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  :config
  (setq doom-modeline-battery t
        doom-modeline-icon t
        doom-modeline-major-mode-icon t
        doom-modeline-major-mode-color-icon t))

;; dashboard
(use-package dashboard
  :ensure t
  :init
  (dashboard-setup-startup-hook)
  :config
  (setq initial-buffer-choice
        #'(lambda ()
            (get-buffer-create "*dashboard*"))
        dashboard-startup-banner (concat user-emacs-directory "assets/akatsuki.txt")
        dashboard-banner-logo-title "Howdy!"
        dashboard-items '((recents  . 5)
                          (projects . 5))))

;; transparency
(set-frame-parameter nil 'alpha-background 80)
(add-to-list 'default-frame-alist '(alpha-background . 70))
