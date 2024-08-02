;;; init.el --- sets up Emacs configuration
;;; Commentary:
;;; gv Emacs configuration

;;; Code:

;;;----------------------------------------
;;; add MELPA package
;;;----------------------------------------
(require 'package)
 (add-to-list 'package-archives
              '("melpa" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(setq package-list '(
                     ;; ui
		     nlinum
                     spacemacs-theme
                     powerline
                     ranger
                     ;; editing
		     ;; clean-aindent-mode
                     ;; flx-ido
                     ;; smex
                     counsel
                     flx
		     ;;undo-tree
		     ;;volatile-highlights
                     ;;duplicate-thing
                     fill-column-indicator
                     indent-guide
                     ;; programming
                     smartparens
		     ;;flycheck
		     ;;flyspell-popup
		     projectile
		     highlight-symbol
                     ;; c
		     ;;company-c-headers
		     ggtags
                     ;; python
                     elpy
		     sphinx-doc
                     ;; markdown
                     markdown-mode
		     ))

;;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;;;----------------------------------------
;;; add custom files
;;;----------------------------------------
(add-to-list 'load-path "~/.emacs.d/gv/")
(add-to-list 'load-path "~/tools/org-cv/")

(require 'gv-user)
(require 'gv-ui)
(require 'gv-editing)
(require 'gv-abbrevs)
(require 'gv-python)
(require 'gv-c)
(require 'gv-org)
(require 'gv-blog)
(require 'gv-devanagari)
(put 'dired-find-alternate-file 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ox-tufte ox-twbs htmlize sphinx-doc spacemacs-theme smartparens ranger projectile powerline nlinum markdown-mode indent-guide highlight-symbol ggtags flx fill-column-indicator elpy counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
