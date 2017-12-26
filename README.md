# flycheck-cwl


*Deprecated*: Now CWL checker is included in Flycheck repository. You just install Flycheck to use CWL checker!

This library adds a on-the-fly syntax checker for [Common Workflow Language](http://www.commonwl.org) in Emacs by using [Flycheck](http://www.flycheck.org/).

Requirements:
  * Emacs 24.4 or later
  * flycheck.el
  * [Schema Salad](https://github.com/common-workflow-language/schema_salad) (2.6.20171101113912 or later)

To use this package, add the following line to your .emacs file:
```emacs
    (require 'flycheck-cwl)
    (setup-flycheck-cwl)
    (setq flycheck-cwl-schema-path "/path/to/CommonWorkflowLanguage.yml")
```
It automatically enables on-the-fly syntax checker for CWL.
