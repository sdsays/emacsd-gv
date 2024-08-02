;;; gv-blog.el --- setup org2blog
;;; Commentary:
;;; sets up org to wordpress blogging environment
;;; also, github based blog

;;; Code:

(require 'ox-publish)
(require 'htmlize)
(set-language-environment "UTF-8")

(defun add-html-file (arg)
  (with-temp-buffer
    (insert-file-contents arg)
    (buffer-string)))

(defun my-site-format-entry (entry style project)
  (format "[[file:%s][%s]] --- %s"
          entry
          (org-publish-find-title entry project)
          (format-time-string "%Y-%m-%d" (org-publish-find-date entry project))))

(setq my-site-project-path "~/proj/sdsays/")
(setq my-site-publish-path "~/proj/sdsays.github.io/")

(setq my-site-extra-head "
<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">
<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crosorigin>
<link href=\"https://fonts.googleapis.com/css2?family=Fira+Code:wght@300..700&family=Hanuman:wght@100;300;400;700;900&family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap\" rel=\"stylesheet\">
<link rel=\"stylesheet\" type=\"text/css\" href=\"/static/gongzhitaao.css\"/>
<link rel=\"stylesheet\" type=\"text/css\" href=\"/static/sd.css\"/>
<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css\">

<!-- Google tag (gtag.js) -->
<script async src=\"https://www.googletagmanager.com/gtag/js?id=G-2RVEM8DBHH\"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-2RVEM8DBHH');
</script>
")

(setq my-site-header-file (concat my-site-project-path "templates/header.html"))
(setq my-site-footer-file (concat my-site-project-path "templates/footer.html"))

(setq org-publish-project-alist
`(("site"
   :components ("site-static", "site-pages", "site-images", "site-lignux", "site-vedanta", "site-dl"))
  ("site-static"
   :base-directory ,(concat my-site-project-path "static/")
   :base-extension ".*"
   :publishing-directory ,(concat my-site-publish-path "static/")
   :publishing-function org-publish-attachment
   :recursive t)

  ("site-images"
   :base-directory ,(concat my-site-project-path "img")
   :base-extension ".*"
   :publishing-directory ,(concat my-site-publish-path "img/")
   :publishing-function org-publish-attachment
   :recursive t)

  ("site-dl"
   :base-directory ,(concat my-site-project-path "dl")
   :base-extension ".*"
   :publishing-directory ,(concat my-site-publish-path "dl/")
   :publishing-function org-publish-attachment
   :recursive t)

  ("site-pages"
   :base-directory ,(concat my-site-project-path "pages/")
   :base-extension "org"
   :publishing-directory ,(concat my-site-publish-path "/")

   :html-link-home "/"
   :html-head nil
   :html-head-extra ,my-site-extra-head
   :html-head-include-default-style nil
   :html-head-include-scripts nil
   :html-home/up-format ""

   :html-preamble ,(add-html-file my-site-header-file)
   :html-postamble ,(add-html-file my-site-footer-file)

   :makeindex nil
   :with-toc nil
   :section-numbers nil

   :publishing-function org-html-publish-to-html)

  ("site-lignux"
   :base-directory ,(concat my-site-project-path "lignux/")
   :base-extension "org"
   :publishing-directory ,(concat my-site-publish-path "lignux/")

   :html-link-home "/"
   :html-head nil
   :html-head-extra ,my-site-extra-head
   :html-head-include-default-style nil
   :html-head-include-scripts nil
   :html-home/up-format ""
   :options ^:{}
   :html-preamble ,(add-html-file my-site-header-file)
   :html-postamble ,(add-html-file my-site-footer-file)

   :makeindex nil
   :auto-sitemap t
   :sitemap-filename "index.org"
   :sitemap-style list
   :sitemap-title "LiGNUx"
   :sitemap-sort-files anti-chronologically
   :sitemap-format-entry my-site-format-entry
   :with-toc nil
   :section-numbers t

   :publishing-function org-html-publish-to-html
   :recursive t)

  ("site-vedanta"
   :base-directory ,(concat my-site-project-path "vedanta/")
   :base-extension "org"
   :publishing-directory ,(concat my-site-publish-path "vedanta/")

   :html-link-home "/"
   :html-head nil
   :html-head-extra ,my-site-extra-head
   :html-head-include-default-style nil
   :html-head-include-scripts nil
   :html-home/up-format ""
   :options ^:{}
   :html-preamble ,(add-html-file my-site-header-file)
   :html-postamble ,(add-html-file my-site-footer-file)

   :makeindex nil
   :auto-sitemap t
   :sitemap-filename "index.org"
   :sitemap-style list
   :sitemap-title "Vedãnta"
   :sitemap-sort-files anti-chronologically
   :sitemap-format-entry my-site-format-entry
   :with-toc nil
   :section-numbers t

   :publishing-function org-html-publish-to-html
   :recursive t)))

(provide 'gv-blog)
;;; gv-blog.el ends here
