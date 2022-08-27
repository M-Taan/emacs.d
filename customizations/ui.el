;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode 0)

;; linum
(global-linum-mode)

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

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; no bell
(setq ring-bell-function 'ignore)

;; counsel and ivy faces

