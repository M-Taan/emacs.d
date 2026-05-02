;; Prevent package.el from loading packages at startup
(setq package-enable-at-startup nil)

;; Native compilation tuning
(setq native-comp-speed 2
      native-comp-compiler-options nil)

;; Performance tuning for LSP and init
(setenv "LSP_USE_PLISTS" "1")

(setq read-process-output-max (* 1024 1024))
(setq gc-cons-threshold 100000000)
