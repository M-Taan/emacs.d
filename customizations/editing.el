(global-hl-line-mode 1)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; specify emacs backups path
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)

(electric-indent-mode +1)

(electric-pair-mode t)

(use-package company
  :ensure t
  :init (global-company-mode))

(use-package company-prescient
  :ensure t
  :after company
  :init (company-prescient-mode 1))

(global-set-key (kbd "TAB") #'indent-for-tab-command)

;; comment/uncoment regions
(global-set-key (kbd "C-c =") 'comment-region)
(global-set-key (kbd "C-c -") 'uncomment-region)

(delete-selection-mode 1)

(use-package xclip
  :ensure t
  :init (xclip-mode 1))

(use-package prescient
  :ensure t
  :init
  (prescient-persist-mode 1))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))
