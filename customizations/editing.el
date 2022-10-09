;; Customizations relating to editing a buffer.

;; Highlights matching parenthesis
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "C-M-a") 'swiper-all)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; specify emacs backups path
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)

;;use 2 spaces for tabs
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

(electric-indent-mode +1)
(electric-pair-mode t)

;; company
(global-company-mode)
;; this needs to run after company mode is enabled
(company-prescient-mode 1)
(global-set-key (kbd "C-p") #'company-indent-or-complete-common)
(global-set-key (kbd "TAB") #'indent-for-tab-command)

;; comment/uncoment regions
(global-set-key (kbd "C-c =") 'comment-region)
(global-set-key (kbd "C-c -") 'uncomment-region)

(delete-selection-mode 1)

;; enable xclip mode by default
;; download xclip on your machine too
(xclip-mode 1)

;; projectile
(require 'projectile)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(projectile-mode +1)
