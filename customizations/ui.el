;; linum stuff
(setq linum-format "%4d \u2502")

(global-set-key (kbd "C-c l") 'linum-mode)

;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode 0)

;; hide toolbar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; hide scroll bar
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; uncomment to specify emacs's initial position and H/W on the screen
;; (setq initial-frame-alist '((top . 0) (left . 0) (width . 177) (height . 53)))

;; No cursor blinking, it sucks
(blink-cursor-mode 0)

(display-battery-mode 1)

(setq-default cursor-type 'bar)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

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
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

;; doom modeline
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
        (lambda ()
          (get-buffer-create "*dashboard*"))
        dashboard-startup-banner
        (concat
         user-emacs-directory
         "/assets/rick-and-morty.png")
        dashboard-banner-logo-title "Howdy, I guess!"
        dashboard-footer-messages '("Programming is about thinking, not typing!"
                                    "Calling EMACS an editor is like calling the Earth a hunk of dirt.")
        dashboard-items '((recents  . 5)
                          (projects . 5))
        dashboard-set-heading-icons t
        dashboard-set-file-icons t))
