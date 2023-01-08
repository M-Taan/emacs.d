(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

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

(custom-set-variables
 '(custom-enabled-themes '(doom-dark+))
 '(custom-safe-themes
   '("7ea883b13485f175d3075c72fceab701b5bf76b2076f024da50dff4107d0db25" "7e068da4ba88162324d9773ec066d93c447c76e9f4ae711ddd0c5d3863489c52" "1a1ac598737d0fcdc4dfab3af3d6f46ab2d5048b8e72bc22f50271fd6d393a00" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "0c08a5c3c2a72e3ca806a29302ef942335292a80c2934c1123e8c732bb2ddd77" "2f8eadc12bf60b581674a41ddc319a40ed373dd4a7c577933acaff15d2bf7cc6" "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" default))
 '(doom-modeline-time t)
 '(doom-modeline-time-icon t)
 '(package-selected-packages
   '(use-package lua-mode doom-modeline doom-themes smudge all all-the-icons counsel-projectile page-break-lines dashboard-ls dashboard monkeytype monky focus cypher-mode xclip yaml-mode company-prescient ivy-prescient counsel magit tagedit elpy prettier-js web-mode projectile flycheck-clj-kondo clojure-mode-extra-font-locking clojure-mode flycheck paredit)))

 ;; custom faces
(custom-set-faces
 '(swiper-match-face-1 ((t (:inherit bold :background "lawn green" :foreground "black")))))

;; font of choice
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-12"))
