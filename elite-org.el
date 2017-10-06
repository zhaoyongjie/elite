(defun custom-org-mode-hook ()
  (fci-mode t)
  (setq org-src-fontify-natively t))
(add-hook 'org-mode-hook 'custom-org-mode-hook)

(if (boundp 'org-project-dir)
  (setq org-publish-project-alist
        `(("kb"
           :base-directory ,org-project-dir
           :base-extension "org"
           :recursive t
           :publishing-directory ,org-publish-dir
           :publishing-function org-html-publish-to-html
           :section-numbers nil
           :auto-sitemap t
           :auto-preamble t
           :headline-levels 4
           :sitemap-filename "index.org"
           :sitemap-title "Knowledge Base"
           :with-sub-superscript nil ;; disable __ tex superscript
           :html-head ,org-project-theme)
          ("static"
           :base-directory ,(concat org-project-dir "/static")
           :base-extension "css\\|js"
           :publishing-directory ,(concat org-publish-dir "/static")
           :publishing-function org-publish-attachment
           :recursive t)
          ("images"
           :base-directory ,(concat org-project-dir "/images")
           :base-extension "png\\|jpg\\|gif"
           :publishing-directory ,(concat org-publish-dir "/images")
           :publishing-function org-publish-attachment
           :recursive t)
          ("docs"
           :base-directory ,(concat org-project-dir "/docs")
           :base-extension "pdf"
           :publishing-directory ,(concat org-publish-dir "/docs")
           :publishing-function org-publish-attachment
           :recursive t)
          )))

(provide 'elite-org)
