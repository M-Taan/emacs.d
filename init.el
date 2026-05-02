;; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el"
                         user-emacs-directory))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package via straight
(straight-use-package 'use-package)

;; All use-package forms use straight by default
(setq straight-use-package-by-default t)

;; Install org for tangling support
(straight-use-package 'org)
(straight-use-package 'org-contrib)
(require 'ob-tangle)

(defun my/tangle-and-load-org (org-file)
  "Tangle an org file to elisp and load it."
  (let ((el-file (concat (file-name-sans-extension org-file) ".el")))
    (when (or (not (file-exists-p el-file))
              (file-newer-than-file-p org-file el-file))
      (org-babel-tangle-file org-file el-file "emacs-lisp"))
    (load el-file nil 'nomessage)))

;; Load all config modules in order
(dolist (module '("01-core"
                  "02-evil"
                  "03-ui"
                  "04-completion"
                  "05-minuet"
                  "06-editing"
                  "07-treesitter"
                  "08-lsp"
                  "09-clojure"
                  "10-typescript"
                  "11-zig"
                  "12-web"
                  "13-c"
                  "14-odin"
                  "15-tools"
                  "16-org"))
  (my/tangle-and-load-org
   (expand-file-name (concat "modules/" module ".org") user-emacs-directory)))
