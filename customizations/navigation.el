(use-package ivy
  :init
  (ivy-mode 1)
  (setq projectile-completion-system 'ivy)
  (setq ivy-use-virtual-buffers t))

(use-package counsel
  :after ivy
  :bind ("C-x b" . counsel-switch-buffer)
  :init (counsel-mode 1))

(use-package ivy-prescient
  :after (ivy counsel)
  :init (ivy-prescient-mode 1))

(use-package projectile
  :bind ("C-c p" . projectile-command-map)
  :init (projectile-mode +1))
