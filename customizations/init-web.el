;; Web mode

;; activate web mode for html, js/jsx files
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; for php stuff
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\.twig\\'" . web-mode))

;; JSX syntax highlighting
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

(defun web-mode-init-hook ()
  "Hook for indentation in Web mode"
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2))

(add-hook 'web-mode-hook  'web-mode-init-hook)

;; prettier it reads from the prettier config file
(defun web-mode-init-prettier-hook ()
  "Hook for Prettier with Web mode."
  (add-node-modules-path)
  (prettier-js-mode))

(add-hook 'web-mode-hook  'web-mode-init-prettier-hook)

(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-auto-closing t)
(setq web-mode-enable-auto-pairing t)
