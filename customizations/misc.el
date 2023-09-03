;; everytime any buffer uses grep-mode
;; emacs will automatically switch to that buffer
(add-hook 'grep-mode-hook
          #'(lambda ()
              (switch-to-buffer-other-window "*grep*")))

(fset 'yes-or-no-p 'y-or-n-p)

;; No need for ~ files when editing
(setq create-lockfiles nil)

(defun split-window-and-switch-below ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))

;; bind to the split-horzn function
(global-set-key (kbd "C-x 2") 'split-window-and-switch-below)

(defun split-window-and-switch-right ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))

;; bind to the split-vert function
(global-set-key (kbd "C-x 3") 'split-window-and-switch-right)

(use-package magit
  :ensure t)

(defun tmux-session-exists? (session)
  (not (string-empty-p (shell-command-to-string (concat "tmux list-sessions | grep " session)))))

(defun open-tmux-session-current-directory ()
  (interactive)
  (let* ((name (replace-regexp-in-string "\\." "" (projectile-project-name)))
         (attach-session? (tmux-session-exists? name)))
    (if attach-session?
        (start-process-shell-command "tmux" nil (concat "alacritty -e tmux attach -t " name))
      (start-process-shell-command "tmux" nil (concat "alacritty -e tmux new-session -s " name)))))

(defun open-tmux-session-current-project-root ()
  (interactive)
  (let* ((name (replace-regexp-in-string "\\." "" (projectile-project-name)))
         (attach-session? (tmux-session-exists? name)))
    (if attach-session?
        (start-process-shell-command "tmux" nil (concat "alacritty -e tmux attach -t " name))
      (start-process-shell-command "tmux" nil (concat "alacritty -e tmux new-session -s " name " -c " (projectile-project-root))))))

(global-set-key (kbd "C-c b v") 'open-tmux-session-current-directory)

(global-set-key (kbd "C-c b b") 'open-tmux-session-current-project-root)
