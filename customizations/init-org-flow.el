;; An attempt at creating a seamless flow ;)
(defconst available-targets '("work" "personal"))

(defun mtaan/current-day-heading ()
  (apply 'format "Date: %s/%s/%s" (calendar-current-date)))

(defun mtaan/get-next-seven-days ()
  (cl-loop for i from 1 to 7
           collect (apply 'format "Date: %s/%s/%s" (calendar-current-date i))))

(defun mtaan/org-add-new-day (target day)
  (when (or (string-empty-p target)
            (not (member target available-targets)))
    (error "Target is not valid"))
  (find-file (concat "~/org/" target ".org"))
  (let* ((heading-exists? (org-find-exact-headline-in-buffer day)))
    (if heading-exists?
        (message "This day is already logged")
      (progn
        (goto-char (point-min))
        (org-insert-heading-respect-content)
        (insert day)))))

(defun mtaan/org-add-new-project-with-day (proj day)
  "By default this will use the work file, maybe later it could be generalized.
   It will also assume that I'm adding a proj under the same day"
  (when (string-empty-p proj)
    (error "Project name shouldn't be empty"))
  (find-file "~/org/work.org")
  (let* ((proj-subheading (concat "PROJ " (capitalize proj)))
         (heading (org-find-exact-headline-in-buffer day nil 't)))
    (unless heading
      (error "This day is not logged"))
    (goto-char heading)
    (end-of-line)
    (org-insert-subheading nil)
    (insert proj-subheading)
    (org-set-property "ID" (concat day " - " proj-subheading))))

(defun mtaan/org-add-new-todo-under-proj-with-day (proj day)
  (when (string-empty-p proj)
    (error "Project name shouldn't be empty"))
  (find-file "~/org/work.org")
  (let* ((proj-subheading (concat "PROJ " (capitalize proj)))
         (heading (org-find-exact-headline-in-buffer day nil 't)))
    (unless heading
      (error "Current day is not logged"))
    (org-id-goto (concat day " - " proj-subheading))
    (end-of-line)
    (org-insert-heading-respect-content)
    (org-demote)
    (insert "TODO ")))

(defun mtaan/org-add-new-day-other-day (target day)
  (interactive (list
                (completing-read "Available targets: " available-targets)
                (completing-read "Available Days: " (mtaan/get-next-seven-days))))
  (mtaan/org-add-new-day target day))

(defun mtaan/org-add-new-proj-other-day (proj day)
  (interactive (list
                (read-string "Project Name: ")
                (completing-read "Available days: "
                                 (mtaan/get-next-seven-days))))
  (mtaan/org-add-new-project-with-day proj day))

(defun mtaan/org-add-new-todo-under-proj-other-day (proj day)
  (interactive (list
                (read-string "Project Name: ")
                (completing-read "Available days: "
                                 (mtaan/get-next-seven-days))))
  (mtaan/org-add-new-todo-under-proj-with-day proj day))

(defun mtaan/org-add-current-day (target)
  (interactive (list (completing-read "Available targets: " available-targets)))
  (mtaan/org-add-new-day target (mtaan/current-day-heading)))

(defun mtaan/org-add-new-project-today (proj)
  (interactive "sProject Name: ")
  (mtaan/org-add-new-project-with-day proj (mtaan/current-day-heading)))

(defun mtaan/org-add-new-todo-under-proj-today (proj)
  (interactive "sProject Name: ")
  (mtaan/org-add-new-todo-under-proj-with-day proj (mtaan/current-day-heading)))
