(defun eshell/clear ()
  ;; clear buffer.
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defun eshell/e (&rest args)
  ;; Open a file in emacs.
  (if (null args)
      (bury-buffer)
    (mapc #'find-file
          (mapcar #'expand-file-name
                  (eshell-flatten-list (reverse args))))))

(defun custom-eshell-mode-hook ()
  (setq eshell-aliases-file (concat elite-install-dir "eshell.alias"))
  (eshell-read-aliases-list)
  (setq eshell-history-size 1024)
  ;; http://stackoverflow.com/questions/19831228/make-eshell-tab-completion-behaves-like-bash
  ;; Make eshell tab completion behaves like Bash
  (setq pcomplete-cycle-completions nil)
  (linum-mode nil)
  (auto-complete-mode nil)
  (setq show-trailing-whitespace nil)
  ;; (setq eshell-prompt-function (lambda () (concat venv-current-name " $ ")))
  )

(add-hook 'eshell-mode-hook 'custom-eshell-mode-hook)

(provide 'elite-eshell)
