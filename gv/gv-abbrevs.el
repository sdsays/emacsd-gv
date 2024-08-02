;;; gv-abbrevs.el --- abbreviations
;;; Commentary:
;;; sets up abbreviations

;;; Code:

(define-abbrev-table 'global-abbrev-table '(

    ;; math/unicode symbols
    ("8in" "∈")
    ("8nin" "∉")
    ("8inf" "∞")
    ("8luv" "♥")
    ("8smly" "☺")

    ;; comments
    ("8cs1" "#---------------------------------------------------------------------")
    ("8cs2" "#-----------------------------------------------------------------")
    ("8cs3" "#-------------------------------------------------------------")
    ("8cl" ";;;-------------------------------------------------------------------")
    ("8cp1" "//--------------------------------------------------------------------")
    ("8cp2" "//----------------------------------------------------------------")
    ("8cp3" "//-------------------------------------------------------------")
    ))

;; stop asking whether to save newly added abbrev when quitting emacs
(setq save-abbrevs nil)

(setq-default abbrev-mode t)

(provide 'gv-abbrevs)
;;; gv-abbrevs.el ends here
