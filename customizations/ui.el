;; linum stuff
(setq linum-format "%4d \u2502")

(global-set-key (kbd "C-c l") 'linum-mode)

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

(use-package haki-theme
  :config
  (setq haki-region "#2e8b6d"))

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
        dashboard-startup-banner
        (concat
         user-emacs-directory
         "/assets/rick-and-morty.png")
        dashboard-banner-logo-title "Howdy, I guess!"
        dashboard-footer-messages '("Programming is about thinking, not typing!"
                                    "Calling EMACS an editor is like calling the Earth a hunk of dirt.")
        dashboard-items '((recents  . 5)
                          (projects . 5))))
