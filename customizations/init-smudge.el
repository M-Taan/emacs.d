(setq smudge-oauth2-client-secret (getenv "SPOTIFY_SECRET"))
(setq smudge-oauth2-client-id (getenv "SPOTIFY_CLIENT"))

;; enable spotify connect
(setq smudge-transport 'connect)

(global-set-key (kbd "C-c .") 'smudge-command-map)

(global-set-key (kbd "C-c s") 'global-smudge-remote-mode)
