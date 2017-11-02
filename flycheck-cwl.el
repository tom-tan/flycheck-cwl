;;; flycheck-cwl.el --- on-the-fly syntax checker for CWL

;; Version: 0.0.0
;; Author: Tomoya Tanjo <ttanjo@gmail.com>
;; URL: https://github.com/tom-tan/flycheck-cwl
;; Package-Requires: ((flycheck "31"))
;; Keywords: languages, flycheck, cwl, common workflow language

;;; Commentary:

;; This library adds a on-the-fly syntax checker for Common Workflow Language
;; in Emacs by using Schema Salad.
;;
;; Requirements:
;;   * Emacs 24.4 or later
;;   * flycheck.el
;;   * Schema Salad (2.6.20171101113912 or later)
;;
;; To use this package, add the following line to your .emacs file:
;;     (require 'flycheck-cwl)
;;     (setup-flycheck-cwl)
;;     (setq flycheck-cwl-schema-path "/path/to/CommonWorkflowLanguage.yml")
;; It automatically enables on-the-fly syntax checker for CWL.

;;; Code:

(require 'flycheck)

(flycheck-def-option-var flycheck-cwl-schema-path "/please/set/path/to/v1.0/CommonWorkflowLanguage.yml" cwl
  "A path for the schema for Common Workflow Language."
  :type 'string
  :safe #'stringp)

;; TODO: How to choose the appropriate cwlVersion?
(flycheck-define-checker cwl
  "A CWL syntax checker using the Schema Salad."
  :command ("schema-salad-tool"
            "--quiet"
            "--print-oneline"
            (eval flycheck-cwl-schema-path)
            source-inplace)
  :error-patterns
  ((error line-start
          (file-name) ":" line ":" column ":" (zero-or-more blank)
          (message (one-or-more not-newline))
          line-end))
  :modes cwl-mode)

;;;###autoload
(defun flycheck-cwl-setup ()
  "Set up for flycheck cwl checker."
  (add-to-list 'flycheck-checkers 'cwl 'append)
  (flycheck-add-next-checker 'yaml-jsyaml '(warning . cwl))
  (flycheck-add-next-checker 'yaml-ruby   '(warning . cwl)))

(provide 'flycheck-cwl)
;;; flycheck-cwl.el ends here
