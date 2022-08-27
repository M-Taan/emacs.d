;; ivy mode on
(ivy-mode 1)

;; Shows a list of buffers
(global-set-key (kbd "C-x b") 'counsel-switch-buffer)

;; super enhance M-x
(global-set-key (kbd "M-x") 'counsel-M-x)

;; projectile everywhere!
(projectile-global-mode)

;;ivy completion
(setq projectile-completion-system 'ivy)

(setq ivy-use-virtual-buffers t)
