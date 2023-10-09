(require 'package)

;; envs
(setenv "LSP_USE_PLISTS" "1")
;; gc stuff
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/"))

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/customizations")

(load "navigation.el")

(load "ui.el")

(load "editing.el")

(load "misc.el")

(load "elisp-editing.el")

(load "init-clojure.el")

(load "init-treesit.el")

(load "init-web.el")

(load "init-yaml.el")

(load "init-lua.el")

(load "init-org.el")

(load "init-lsp.el")

(load "init-stumpwm.el")

(load "init-org-flow.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)

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

;; transparency
(set-frame-parameter nil 'alpha-background 90)

(add-to-list 'default-frame-alist '(alpha-background . 90))

