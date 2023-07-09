(defun web-mode-init-hook ()			       
  "Hook for indentation in Web mode"		       
  (setq web-mode-markup-indent-offset 2)	       
  (setq web-mode-code-indent-offset 2)	       
  (setq web-mode-css-indent-offset 2))	       
						       
(use-package add-node-modules-path		       
  :ensure t)					       
						       
(use-package prettier-js			       
  :ensure t)					       
						       
(defun prettier-js-hook ()			       
  (when (s-matches?				       
         (rx (or ".js" ".ts" ".jsx" ".tsx") eos)    
         (buffer-file-name))			       
    (add-node-modules-path)			       
    (prettier-js-mode)))			       
						       
(use-package tagedit				       
  :ensure t)					       
						       
(use-package web-mode			       
  :ensure t					       
  :hook					       
  (web-mode . web-mode-init-hook)		       
  :mode ("\\.html?\\'")			       
  :config					       
  (setq web-mode-enable-current-column-highlight t  
        web-mode-enable-current-element-highlight t 
        web-mode-enable-auto-closing t	       
        web-mode-enable-auto-pairing t))	       

(use-package typescript-ts-mode
  :ensure t
  :hook
  (typescript-ts-mode . prettier-js-hook)
  (tsx-ts-mode . prettier-js-hook)
  :mode (("\\.ts\\'" . typescript-ts-mode))
  :mode (("\\.tsx\\'" . tsx-ts-mode)))
