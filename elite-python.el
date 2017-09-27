;; use ipython
(defun setup-ipython ()
  "Setup ipython integration with python-mode"
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args "--simple-prompt -i"
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
   python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))

(when (executable-find "ipython")
  (linum-mode -1)
  (setup-ipython))

;; python
(defun custom-python-mode-hook ()
  (flycheck-mode -1)
  ;; (setq flycheck-pylintrc "~/.pylintrc")
  ;; (flycheck-select-checker 'python-flake8)
  ;; (fci-mode t)
  (hs-minor-mode t)
  (elpy-enable)
  (setq elpy-rpc-backend "jedi")
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key elpy-mode-map (kbd "C-.") 'elpy-goto-definition)
  (define-key elpy-mode-map (kbd "C-c C-.") 'elpy-goto-definition-other-window))
(add-hook 'python-mode-hook 'custom-python-mode-hook)

(provide 'elite-python)
