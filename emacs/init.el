(defvar bootstrap-version)
(let ((bootstrap-file
	       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
            (bootstrap-version 5))
    (unless (file-exists-p bootstrap-file)
          (with-current-buffer
	            (url-retrieve-synchronously
		               "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
			                'silent 'inhibit-cookies)
		          (goto-char (point-max))
			        (eval-print-last-sexp)))
      (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

;;load custom setting
;;(setq custom-file "~/.config/emacs/config/theme.el")
;;(load-file custom-file)
;;load load
;;(require 'theme)
(defun load-directory (directory)
    "Load recursively all `.el' files in DIRECTORY."
      (dolist (element (directory-files-and-attributes directory nil nil nil))
	    (let* ((path (car element))
		              (fullpath (concat directory "/" path))
			                 (isdir (car (cdr element)))
					            (ignore-dir (or (string= path ".") (string= path ".."))))
	            (cond
		             ((and (eq isdir t) (not ignore-dir))
			              (load-directory fullpath))
			            ((and (eq isdir nil) (string= (substring path -3) ".el"))
				             (load (file-name-sans-extension fullpath)))))))
(load-directory "~/.config/emacs/config")

