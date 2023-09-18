(defconst available-targets '("work" "personal"))

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
  (setq org-todo-keywords '((type "TODO(t)" "PROJ(p)" "|" "DONE(d)")))
  (setq org-todo-keyword-faces
        '(("PROJ" :foreground "#32cd32" :weight bold)
          ("TODO" :foreground "#adff2f" :weight bold)))
  (setq org-agenda-files '("~/org/work.org"
                           "~/org/personal.org"
                           "~/org/calendar.org"))
  (setq org-agenda-timegrid-use-ampm t)
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done t)
  (setq org-log-into-drawer t)
  (setq org-ellipsis " ▼")
  (setq org-capture-templates
        (doct '(("Work" :keys "w" :file "~/org/work.org" :children
                 (("TODO" :keys "t" :empty-lines 1 :headline "Tasks" :template ("** TODO %^{Description} :project:%^g"
                                                                                ":PROPERTIES:"
                                                                                ":Created: %U"
                                                                                ":Effort: %^{PROMPT}"
                                                                                ":Description: %^{PROMPT}"
                                                                                ":END:"
                                                                                "%?"))))
                ("Personal" :keys "p" :file "~/org/personal.org" :children
                 (("TODO" :keys "t" :empty-lines 1 :headline "Tasks" :template ("** TODO %^{Description} %^g"
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
  (dolist (face '((org-level-1 . 1.4)
                  (org-level-2 . 1.3)
                  (org-level-3 . 1.2)
                  (org-level-4 . 1.2)
                  (org-level-5 . 1.2)
                  (org-level-6 . 1.2)
                  (org-level-7 . 1.2)
                  (org-level-8 . 1.2)))
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
        org-gcal-fetch-file-alist '(("mtaan@rams.services" .  "~/org/calendar.org")))
  (setq plstore-cache-passphrase-for-symmetric-encryption t))

;; An attempt at creating a seamless flow ;)

(defun mtaan/current-day-heading ()
  (apply 'format "Date: %s/%s/%s" (calendar-current-date)))

(defun mtaan/org-add-new-day (target)
  (interactive (list (completing-read "Available targets: " available-targets)))
  (when (or (string-empty-p target)
            (not (member target available-targets)))
    (error "Target is not valid"))
  (find-file (concat "~/org/" target ".org"))
  (let* ((heading (mtaan/current-day-heading))
         (heading-exists? (org-find-exact-headline-in-buffer heading)))
    (if heading-exists?
        (message "Current day is already logged")
      (progn
        (goto-char (point-min))
        (org-insert-heading-respect-content)
        (insert heading)))))

(defun mtaan/org-add-new-project (proj)
  "By default this will use the work file, maybe later it could be generalized.
   It will also assume that I'm adding a proj under the same day"
  (interactive "sProject Name: ")
  (when (string-empty-p proj)
    (error "Project name shouldn't be empty"))
  (find-file "~/org/work.org")
  (let* ((proj-subheading (concat "PROJ " (capitalize proj)))
         (day-heading (mtaan/current-day-heading))
         (heading (org-find-exact-headline-in-buffer day-heading nil 't)))
    (unless heading
      (error "Current day is not logged"))
    (goto-char heading)
    (end-of-line)
    (org-insert-subheading nil)
    (insert proj-subheading)
    (org-set-property "ID" (concat day-heading " - " proj-subheading))))

(defun mtaan/org-add-new-todo-under-proj (proj)
  (interactive "sTODO Project Name: ")
  (when (string-empty-p proj)
    (error "Project name shouldn't be empty"))
  (find-file "~/org/work.org")
  (let* ((proj-subheading (concat "PROJ " (capitalize proj)))
         (day-heading (mtaan/current-day-heading))
         (heading (org-find-exact-headline-in-buffer day-heading nil 't)))
    (unless heading
      (error "Current day is not logged"))
    (org-id-goto (concat day-heading " - " proj-subheading))
    (end-of-line)
    (org-insert-heading-respect-content)
    (org-demote)
    (insert "TODO ")))
