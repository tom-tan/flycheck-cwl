# flycheck-cwl
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

KNOWN ISSUES:
- ~~The error messages are currently incomplete.~~
- It shows redundant error messages.
  - ~~It will be fixed once [this request](https://github.com/common-workflow-language/schema_salad/pull/135) is merged.~~
  - ~~Merged! Now you can use master branch of Schema Salad or wait until it is ready for pip.~~
  - The latest Schema Salad in pip is updated to 2.6.20171101113912. Now you can use it for flycheck-cwl.
- This package cannot be installed via [MELPA](https://melpa.org/).
  - Once the above issue is solved, I will do that.
