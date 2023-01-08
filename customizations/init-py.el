;; Python

(use-package elpy
  :hook (elpy-mode . (lambda ()
                       (add-hook 'before-save-hook
                                 'elpy-black-fix-code nil t)))
  :bind (:map elpy-refactor-map
              ("f" . elpy-black-fix-code)))
