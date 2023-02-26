(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook
  (clojure-mode . lsp)
  (clojurescript-mode . lsp)
  (clojurec-mode . lsp)
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  (define-key lsp-mode-map (kbd "C-c w") lsp-command-map))

(use-package lsp-treemacs
  :after lsp
  :ensure t)

(use-package lsp-ivy
  :ensure t)

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (set-face-attribute 'lsp-ui-sideline-global nil
                      :background "black")
  (define-key lsp-mode-map (kbd "C-c w s d") #'lsp-ui-doc-toggle)
  :custom
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-doc-position 'top)
  (lsp-ui-doc-mode nil))

(use-package flycheck
  :ensure t)
