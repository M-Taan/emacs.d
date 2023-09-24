(use-package lsp-mode
  :ensure t
  :commands lsp lsp-deferred
  :hook
  (clojure-mode . lsp-deferred)
  (clojurescript-mode . lsp-deferred)
  (clojurec-mode . lsp-deferred)
  (typescript-ts-mode . lsp-deferred)
  (tsx-ts-mode . lsp-deferred)
  :config
  (define-key lsp-mode-map (kbd "C-c w") lsp-command-map)

  (setq lsp-headerline-breadcrumb-enable nil
        lsp-enable-indentation nil
        lsp-use-plists t
        lsp-modeline-code-actions-enable nil
        lsp-modeline-diagnostics-enable nil
        lsp-modeline-diagnostics-mode nil
        lsp-completion-mode nil))

(use-package lsp-ivy
  :ensure t)

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (set-face-attribute 'lsp-ui-sideline-global nil
                      :background "black")
  (setq lsp-ui-doc-enable nil)
  (define-key lsp-mode-map (kbd "C-c w s d") #'lsp-ui-doc-toggle)
  (define-key lsp-mode-map (kbd "C-c w s f") #'lsp-ui-doc-focus-frame)
  :custom
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-doc-position 'top))

(use-package flycheck
  :ensure t)
