;;; gv-python.el --- setup python editing
;;; Commentary:
;;; sets up Python editing environment

;;; Code:

(elpy-enable)

(add-hook 'python-mode-hook (lambda ()
			      (require 'sphinx-doc)
			      (sphinx-doc-mode t)))

(provide 'gv-python)
;;; gv-python.el ends here
