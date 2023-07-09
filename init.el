(require 'package)

(setq gc-cons-threshold 100000000)

(setq read-process-output-max (* 1024 1024))

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/"))

(package-initialize)

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

(load "init-treesit.el")

(load "init-web.el")

(load "init-py.el")

(load "init-yaml.el")

(load "init-lua.el")

(load "init-org.el")

(load "init-lsp.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-city-lights))
 '(custom-safe-themes
   '("2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" "81fb9ae452bae0521c1faeee58c42e9f08f9bcec3fa8519a85bfda9f3fbb626d" default))
 '(package-selected-packages
   '(treesit typescript-ts-base-mode tsx-ts-mode yaml-mode xclip web-mode vterm use-package tagedit smudge projectile prettier-js paredit org-gcal org-bullets magit lua-mode lsp-ui lsp-treemacs lsp-ivy ivy-prescient guru-mode flycheck elpy doom-themes doom-modeline doct dashboard counsel company-prescient cider all-the-icons add-node-modules-path ace-jump-mode))
 '(warning-suppress-log-types '((lsp-mode))))

 ;; custom faces
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-battery-charging ((t (:inherit success :weight normal)))))

;; font of choice
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-12"))

(set-frame-parameter (selected-frame) 'alpha '(100 . 95))
(add-to-list 'default-frame-alist '(alpha . (100 . 95)))
