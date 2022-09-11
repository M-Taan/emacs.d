;; Customizations relating to editing a buffer.

;; Highlights matching parenthesis
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; swiper instead of isearch
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-M-a") 'swiper-all)
(global-set-key (kbd "C-M-s") 'swiper-isearch)
(global-set-key (kbd "C-M-r") 'swiper-isearch-backward)

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
