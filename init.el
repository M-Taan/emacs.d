(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

;;;;
;; Customization
;;;;

;; load the path where the the other configurations live
(add-to-list 'load-path "~/.emacs.d/customizations")

(load "navigation.el")

(load "ui.el")

(load "editing.el")

(load "misc.el")

(load "elisp-editing.el")

(load "init-clojure.el")

(load "init-web.el")

(load "init-py.el")

(load "init-yaml.el")

(load "init-smudge.el")

(load "init-lua.el")

(load "init-cypher.el")

(load "init-org.el")

(load "request.el")

(load "init-lsp.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cypher-indent-offset 10)
 '(doom-modeline-time t)
 '(doom-modeline-time-icon t)
 '(package-selected-packages
   '(lsp-ui lsp-ivy lsp-treemacs lsp-mode org-faces doct org-gcal org-bullets org-agenda tree-sitter-langs tree-sitter use-package lua-mode doom-modeline doom-themes smudge all all-the-icons page-break-lines dashboard-ls dashboard monkeytype monky focus xclip yaml-mode company-prescient ivy-prescient counsel magit tagedit elpy prettier-js web-mode projectile flycheck-clj-kondo clojure-mode-extra-font-locking clojure-mode flycheck paredit)))

 ;; custom faces
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(swiper-match-face-1 ((t (:inherit bold :background "lawn green" :foreground "black")))))

;; font of choice
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-12"))

(set-frame-parameter (selected-frame) 'alpha '(95 . 90))
(add-to-list 'default-frame-alist '(alpha . (95 . 90)))
