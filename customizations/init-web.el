;; Web mode

(defun web-mode-init-hook ()
  "Hook for indentation in Web mode"
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2))

(use-package tagedit
  :ensure t)

(use-package add-node-modules-path
  :ensure t)

(use-package prettier-js
  :ensure t)

(defun prettier-js-web-mode-hook ()
  (when (s-starts-with?
         (car
          (last
           (split-string (buffer-file-name) "\\."))) "js")
    (add-node-modules-path)
    (prettier-js-mode)))

(use-package web-mode
  :ensure t
  :hook
  (web-mode . web-mode-init-hook)
  (web-mode . prettier-js-web-mode-hook)
  :mode ("\\.jsx?$"
         "\\.html?\\'"
         "\\.css?\\'"
         "\\.phtml\\'"
         "\\.tpl\\'"
         "\\.php\\'"
         "\\.html\\.twig\\'"
         "\\.js[x]?\\'")
  :config
  (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
  (setq web-mode-enable-current-column-highlight t
        web-mode-enable-current-element-highlight t
        web-mode-enable-auto-closing t
        web-mode-enable-auto-pairing t))
