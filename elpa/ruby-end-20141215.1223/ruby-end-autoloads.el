;;; ruby-end-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "ruby-end" "ruby-end.el" (0 0 0 0))
;;; Generated autoloads from ruby-end.el

(autoload 'ruby-end-mode "ruby-end" "\
Automatic insertion of end blocks for Ruby.

If called interactively, enable Ruby-End mode if ARG is positive, and
disable it if ARG is zero or negative.  If called from Lisp,
also enable the mode if ARG is omitted or nil, and toggle it
if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(add-hook 'ruby-mode-hook 'ruby-end-mode)

(add-hook 'enh-ruby-mode-hook 'ruby-end-mode)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ruby-end" '("ruby-end-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ruby-end-autoloads.el ends here
