(use-package ivy
  :ensure t
  :init
  (ivy-mode 1)
  (setq projectile-completion-system 'ivy)
  (setq ivy-use-virtual-buffers t))

(use-package counsel
  :ensure t
  :after ivy
  :bind ("C-x b" . counsel-switch-buffer)
  :init (counsel-mode 1))

(use-package ivy-prescient
  :ensure t
  :after (ivy counsel)
  :init (ivy-prescient-mode 1))

(use-package projectile
  :ensure t
  :bind ("C-c p" . projectile-command-map)
  :init (projectile-mode +1))

(use-package counsel-projectile
  :ensure t
  :after counsel
  :init
  (counsel-projectile-mode 1))

(global-set-key (kbd "C-c <right>") 'forward-sexp)
(global-set-key (kbd "C-c <left>") 'backward-sexp)
(global-set-key (kbd "C-c C-SPC") 'mark-sexp)
