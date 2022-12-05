;; linum stuff
(setq linum-format "%4d \u2502")

(global-set-key (kbd "C-c l") 'linum-mode)

;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode 0)

;; no toolbar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; uncomment to specify emacs's initial position and H/W on the screen
;; (setq initial-frame-alist '((top . 0) (left . 0) (width . 177) (height . 53)))

;; No cursor blinking, it sucks
(blink-cursor-mode 0)

(setq-default cursor-type 'bar)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; no bell
(setq ring-bell-function 'ignore)

(load-theme 'doom-dark+ t)

(doom-modeline-mode 1)

;; icons
(when (display-graphic-p)
  (require 'all-the-icons))

;; dashboard
(require 'dashboard)

(dashboard-setup-startup-hook)

(setq initial-buffer-choice
      (lambda ()
        (get-buffer-create "*dashboard*")))

(setq dashboard-startup-banner
      (concat
       user-emacs-directory
       "/assets/rick-and-morty.png"))

(setq dashboard-banner-logo-title "Howdy, I guess!")

(setq dashboard-footer-messages '("Programming is about thinking, not typing!"
                                  "Calling EMACS an editor is like calling the Earth a hunk of dirt."))

(setq dashboard-items '((recents  . 5)
                        (projects . 5)))

(setq dashboard-set-heading-icons t)

(setq dashboard-set-file-icons t)
