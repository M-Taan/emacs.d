;; Clojure <3

(use-package clojure-mode
  :ensure t
  :after paredit
  :mode (("\\.edn$" . clojure-mode)
         ("\\.boot$" . clojure-mode)
         ("\\.cljs.*$" . clojurescript-mode)
         ("\\.cljc.*$" . clojurec-mode)
         ("lein-env" . enh-ruby-mode)
         ("\\.boot\\'" . clojure-mode))
  :hook
  (clojure-mode . subword-mode)
  (clojure-mode . enable-paredit-mode))

(use-package cider
  :ensure t
  :after (clojure-mode paredit eldoc)
  :hook
  (cider-mode . eldoc-mode)
  (cider-repl-mode . paredit-mode)
  (clojure-mode . cider-mode)
  (cider-repl-mode . paredit-mode)
  :config
  (setq cider-repl-pop-to-buffer-on-connect t
        cider-show-error-buffer t
        cider-auto-select-error-buffer t
        cider-repl-history-file "~/.emacs.d/cider-history"
        cider-repl-wrap-history t))
