(defun org-mode-init-hook ()
  (org-indent-mode)
  (visual-line-mode 1))

(use-package doct
  :ensure t)

(use-package org
  :ensure t
  :after doct
  :bind
  ("C-c a" . org-agenda)
  ("C-c c" . org-capture)
  :hook
  (org-mode . org-mode-init-hook)
  (org-agenda-mode . org-mode-init-hook)
  :config
  (setq org-agenda-files '("~/org/work.org"
                           "~/org/personal.org"
                           "~/org/calendar.org"))

  (setq org-agenda-timegrid-use-ampm t)
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done t)
  (setq org-log-into-drawer t)

  (setq org-capture-templates
        (doct '(("Work" :keys "w" :file "~/org/work.org" :children
                 (("TODO" :keys "t" :empty-lines 1 :headline "Tasks" :template ("* TODO %^{Description} :project:%^g"
                                                                                ":PROPERTIES:"
                                                                                ":Created: %U"
                                                                                ":Effort: %^{PROMPT}"
                                                                                ":Description: %^{PROMPT}"
                                                                                ":END:"
                                                                                "%?"))))
                ("Personal" :keys "p" :file "~/org/personal.org" :children
                 (("TODO" :keys "t" :empty-lines 1 :headline "Tasks" :template ("* TODO %^{Description} %^g"
                                                                                ":PROPERTIES:"
                                                                                ":Created: %U"
                                                                                ":Effort: %^{PROMPT}"
                                                                                ":Description: %^{PROMPT}"
                                                                                ":END:"
                                                                                "%?")))))))

  ;; For archiving finished tasks
  (setq org-refile-targets
        '(("~/org/archives/work.org" :maxlevel . 1)
          ("~/org/archives/personal.org" :maxlevel . 1)))

  ;; Refiling doesn't save the updated buffer
  (advice-add 'org-refile :after 'org-save-all-org-buffers)

  (require 'org-indent)

  ;; Fonts
  (set-face-attribute 'org-document-title nil :font "DejaVu Sans Mono-12" :weight 'bold :height 1.1)

  (set-face-attribute 'org-document-info nil :font "DejaVu Sans Mono-12" :weight 'bold :height 1.1)

  (set-face-attribute 'org-document-info-keyword nil :font "DejaVu Sans Mono-12" :weight 'bold :height 1.1)

  (dolist (face '((org-level-1 . 1.5)
                  (org-level-2 . 1.3)
                  (org-level-3 . 1.1)
                  (org-level-4 . 1.1)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "DejaVu Sans Mono-12" :weight 'medium :height (cdr face)))

  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

  (set-face-attribute 'org-column nil :background nil)
  (set-face-attribute 'org-column-title nil :background nil))

(use-package org-bullets
  :ensure t
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package org-gcal
  :ensure t
  :after org
  :init
  (setq org-gcal-client-id (getenv "EMACS_GOOGLE_CALENDER_CLIENT_ID")
        org-gcal-client-secret (getenv "EMACS_GOOGLE_CALENDER_SECRET_ID")
        org-gcal-fetch-file-alist '(((getenv "EMACS_GOOGLE_CALENDAR_EMAIL_1") .  "~/org/calendar.org")))
  (setq plstore-cache-passphrase-for-symmetric-encryption t))
