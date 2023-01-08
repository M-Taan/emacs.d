;; smudge for spotify

(use-package simple-httpd)

(use-package smudge
  :after simple-httpd
  :init
  (setq smudge-oauth2-client-secret (getenv "SPOTIFY_SECRET"))
  (setq smudge-oauth2-client-id (getenv "SPOTIFY_CLIENT"))
  (setq smudge-transport 'connect)
  :bind
  ("C-c ." . smudge-command-map)
  ("C-c s" . global-smudge-remote-mode))
