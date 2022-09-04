;; Packages

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
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
    
    ;; expermintal
    xclip
    
    spacemacs-theme))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "init-clojure.el")
(load "init-js.el")
(load "init-php.el")
(load "init-py.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 4)
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "683b3fe1689da78a4e64d3ddfce90f2c19eb2d8ab1bab1738a63d8263119c3f4" "5586a5db9dadef93b6b6e72720205a4fa92fd60e4ccfd3a5fa389782eab2371b" "2853dd90f0d49439ebd582a8cbb82b9b3c2a02593483341b257f88add195ad76" "dc8285f7f4d86c0aebf1ea4b448842a6868553eded6f71d1de52f3dcbc960039" "1aa4243143f6c9f2a51ff173221f4fd23a1719f4194df6cef8878e75d349613d" "991ca4dbb23cab4f45c1463c187ac80de9e6a718edc8640003892a2523cb6259" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350" "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68" "b9761a2e568bee658e0ff723dd620d844172943eb5ec4053e2b199c59e0bcc22" "be84a2e5c70f991051d4aaf0f049fa11c172e5d784727e0b525565bb1533ec78" "251ed7ecd97af314cd77b07359a09da12dcd97be35e3ab761d4a92d8d8cf9a71" "8d8207a39e18e2cc95ebddf62f841442d36fcba01a2a9451773d4ed30b632443" "a9abd706a4183711ffcca0d6da3808ec0f59be0e8336868669dc3b10381afb6f" "b99e334a4019a2caa71e1d6445fc346c6f074a05fcbb989800ecbe54474ae1b0" "3fe1ebb870cc8a28e69763dde7b08c0f6b7e71cc310ffc3394622e5df6e4f0da" "b54376ec363568656d54578d28b95382854f62b74c32077821fdfd604268616a" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "1cae4424345f7fe5225724301ef1a793e610ae5a4e23c023076dc334a9eb940a" "8b6506330d63e7bc5fb940e7c177a010842ecdda6e1d1941ac5a81b13191020e" "5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "4fda8201465755b403a33e385cf0f75eeec31ca8893199266a6aeccb4adedfa4" "ce4234c32262924c1d2f43e6b61312634938777071f1129c7cde3ebd4a3028da" "545ab1a535c913c9214fe5b883046f02982c508815612234140240c129682a68" "0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478" "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "adaf421037f4ae6725aa9f5654a2ed49e2cd2765f71e19a7d26a454491b486eb" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "6945dadc749ac5cbd47012cad836f92aea9ebec9f504d32fe89a956260773ca4" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "0b7861ad7f8578f55a69971da5c7a7fa1f86e47c6428ee026208cfea9e7184e8" "d36399e2e1d256464562a3b9e543267ebf6dc7b38e2766f7f26fe021db925b87" "fefb007c42fb53c7d6c2c640e697d82316fb9a45fd2b512ee8f5bb53b3b866b6" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(package-selected-packages
   '(spacemacs-theme xclip company-prescient ivy-prescient counsel magit tagedit elpy prettier-js web-mode projectile cider flycheck-clj-kondo clojure-mode-extra-font-locking clojure-mode flycheck paredit)))

 ;; custom faces
(custom-set-faces)
 
;; font of choice
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-12"))


;; This stuff below needs to be separated into their designated files (editing, keybinds, etc...)

;; company
(global-company-mode)
;; this needs to run after company mode is enabled
(company-prescient-mode 1)
(global-set-key (kbd "C-p") #'company-indent-or-complete-common)
(global-set-key (kbd "TAB") #'indent-for-tab-command)

;; comment/uncoment regions
(global-set-key (kbd "C-c =") 'comment-region)
(global-set-key (kbd "C-c -") 'uncomment-region)

;; treats emacs region as typical outside of emacs
;; pasting on some selected text removes it
;; same as deleting it
;; doesn't work when using C-v (shell-like copying)
;; works when using emacs (C-y)
(delete-selection-mode 1)

;; enable xclip mode by default
;; download xclip on your machine too
(xclip-mode 1)

;; linum stuff
(setq linum-format "%4d \u2502")
(set-face-foreground 'linum "#00FFFF")

;; persist over sessions
(prescient-persist-mode 1)
