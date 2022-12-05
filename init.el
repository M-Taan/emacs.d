;; Packages

;; Define package repositories
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; initialize the packages
(package-initialize)

;; get the latest version of the packages
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    paredit

    flycheck

    ;; key bindings and code colorization for Clojure
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    flycheck-clj-kondo

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; project navigation
    projectile

    ;; Javascript and Web in general related stuff
    ;; we need to move this stuff to other
    ;; file (when I have time to play around it on the weekend)
    web-mode

    add-node-modules-path

    prettier-js

    ;; python related stuff
    elpy

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit

    ;; installs ivy, counsel and swiper
    counsel

    ivy-prescient

    company-prescient

    ;; support for YAML
    yaml-mode

    ;; expermintal
    xclip

    vterm

    all-the-icons

    dashboard

    doom-themes

    doom-modeline

    ;; spotify
    smudge))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" default))
 '(package-selected-packages
   '(doom-modeline doom-themes smudge all all-the-icons counsel-projectile page-break-lines dashboard-ls dashboard monkeytype monky focus cypher-mode xclip yaml-mode company-prescient ivy-prescient counsel magit tagedit elpy prettier-js web-mode projectile cider flycheck-clj-kondo clojure-mode-extra-font-locking clojure-mode flycheck paredit)))

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

;; persist over sessions
(prescient-persist-mode 1)
