;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; everytime any buffer uses grep-mode
;; emacs will automatically switch to that buffer
(add-hook 'grep-mode-hook
          '(lambda ()
             (switch-to-buffer-other-window "*grep*")))

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

;; vterm stuff
(defun vterm-open-below ()
  "Open vterm below the current buffer"
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1)
  (vterm))

;; bind to the vterm-below function
(global-set-key (kbd "C-c b v") 'vterm-open-below)

(global-set-key (kbd "C-c v") 'vterm)

;; remove trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
