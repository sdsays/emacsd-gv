;;; gv-rust.el --- setup rust editing
;;; Commentary:
;;; sets up Rust editing environment

;;; Code:

(setq racer-rust-src-path gv-user-rust-src-dir)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(provide 'gv-rust)
;;; gv-rust.el ends here
