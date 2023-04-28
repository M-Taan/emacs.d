;; Web mode

(defun web-mode-init-hook ()
  "Hook for indentation in Web mode"
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2))

(use-package tagedit
  :ensure t)

(use-package web-mode
  :ensure t
  :hook
  (web-mode . web-mode-init-hook)
  :mode ("\\.html?\\'"
         "\\.css?\\'"
         "\\.js\\'" 
         "\\.jsx\\'"
         "\\.ts\\'"
         "\\.tsx\\'"
         "\\.json\\'")
  :config
  (setq web-mode-enable-current-column-highlight t
        web-mode-enable-current-element-highlight t
        web-mode-enable-auto-closing t
        web-mode-enable-auto-pairing t))
