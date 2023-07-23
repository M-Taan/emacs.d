;; everytime any buffer uses grep-mode
;; emacs will automatically switch to that buffer
(add-hook 'grep-mode-hook
          #'(lambda ()
              (switch-to-buffer-other-window "*grep*")))

(fset 'yes-or-no-p 'y-or-n-p)

;; No need for ~ files when editing
(setq create-lockfiles nil)

(defun split-window-and-switch-below ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))

;; bind to the split-horzn function
(global-set-key (kbd "C-x 2") 'split-window-and-switch-below)

(defun split-window-and-switch-right ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))

;; bind to the split-vert function
(global-set-key (kbd "C-x 3") 'split-window-and-switch-right)

(use-package vterm
  :ensure t
  :bind
  ("C-c b v" . vterm-open-below)
  ("C-c v" . vterm))

(defun vterm-open-below ()
  "Open vterm below the current buffer"
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1)
  (vterm))

(use-package magit
  :ensure t)

;; (use-package guru-mode
;;   :ensure t
;;   :config
;;   (guru-global-mode 1))
