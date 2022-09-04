;; ivy mode on
(ivy-mode 1)

(counsel-mode 1)

;; needs to run after ivy is enabled
(ivy-prescient-mode 1)

(global-set-key (kbd "C-x b") 'counsel-switch-buffer)

;; projectile everywhere!
(projectile-global-mode)

;;ivy completion
(setq projectile-completion-system 'ivy)

(setq ivy-use-virtual-buffers t)
