(use-package lsp-mode
  :ensure t
  :commands lsp lsp-deferred
  :hook
  (clojure-mode . lsp-deferred)
  (clojurescript-mode . lsp-deferred)
  (clojurec-mode . lsp-deferred)
  (web-mode . lsp-deferred)
  :config
  (setq gc-cons-threshold (* 100 1024 1024)
        read-process-output-max (* 1024 1024))

  (define-key lsp-mode-map (kbd "C-c w") lsp-command-map)

  (setq lsp-headerline-breadcrumb-enable nil
        lsp-enable-indentation nil
        lsp-modeline-code-actions-enable nil
        lsp-modeline-diagnostics-enable nil
        lsp-modeline-diagnostics-mode nil
        lsp-completion-mode nil))

(use-package lsp-treemacs
  :after lsp-mode
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
  (setq lsp-ui-doc-enable nil)
  :custom
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-doc-position 'top))

(use-package flycheck
  :ensure t)
