;;; gv-ui.el --- setup ui
;;; Commentary:
;;; sets up startup and user interface

;;; Code:

;;;______________________________________________________________________
;;; startup, appearance
;;;----------------------------------------------------------------------
(setq inhibit-startup-screen t)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

(setq frame-title-format
      '(buffer-file-name "%f"
			 (dired-directory dired-directory "%b")))

(global-hl-line-mode)
;; (indent-guide-global-mode)
;; (setq indent-guide-recursive t)
(global-nlinum-mode 1)

;;;----------------------------------------------------------------------
;;; buffer handling
;;;----------------------------------------------------------------------
(global-auto-revert-mode)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;;----------------------------------------------------------------------
;;; save recent files
;;;----------------------------------------------------------------------
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(run-at-time nil (* 5 60) 'recentf-save-list) ; save every 5 minutes

;;;----------------------------------------------------------------------
;;; font, color theme
;;;----------------------------------------------------------------------
;; change font to Inconsolata for better looking text
;; remember to install the font Inconsolata first
(setq default-frame-alist '((font . "FiraCode-13")))
;; (setq default-frame-alist '((font . "Inconsolata-12")))
;; set italic font for italic face, since Emacs does not set italic
;; face automatically
;; (set-face-attribute 'italic nil
;;                     :family "Inconsolata-Italic")
;;(load-theme 'leuven t)
(load-theme 'spacemacs-light t)
(powerline-default-theme)

;;;----------------------------------------------------------------------
;;; set cursor type
;;; Change cursor color according to mode
;;;----------------------------------------------------------------------
(setq djcb-read-only-color       "red")
;; valid values are t, nil, box, hollow, bar, (bar . WIDTH), hbar,
;; (hbar. HEIGHT); see the docs for set-cursor-type
(setq djcb-read-only-cursor-type 'hbar)
(setq djcb-overwrite-color       "red3")
(setq djcb-overwrite-cursor-type 'box)
(setq djcb-normal-color          "red3")
(setq djcb-normal-cursor-type    'bar)
(defun djcb-set-cursor-according-to-mode ()
  "change cursor color and type according to some minor modes."
  (cond
   (buffer-read-only
    (set-cursor-color djcb-read-only-color)
    (setq cursor-type djcb-read-only-cursor-type))
   (overwrite-mode
    (set-cursor-color djcb-overwrite-color)
    (setq cursor-type djcb-overwrite-cursor-type))
   (t
    (set-cursor-color djcb-normal-color)
    (setq cursor-type djcb-normal-cursor-type))))
(add-hook 'post-command-hook 'djcb-set-cursor-according-to-mode)

;;;----------------------------------------------------------------------
;;; 80 column rule
;;;----------------------------------------------------------------------
;; (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
;; (global-fci-mode 1)
;; (setq fci-rule-column 80)


(provide 'gv-ui)
;;; gv-ui.el ends here
