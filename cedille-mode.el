;;; cedille-mode.el --- Major mode for Cedille

;;; Commentary:

;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Dependency


;;; Code:

(defvar cedille-version "0.1"
  "The version of the cedille mode.")

(require 'quail)

(setq auto-mode-alist (cons (cons "\\.ced\\'" 'cedille-mode) auto-mode-alist))

(modify-coding-system-alist 'file "\\.ced\\'" 'utf-8)

(with-temp-buffer
    (quail-define-package "Cedille" "UTF-8" "δ" t ; guidance
     "Cedille input method."
     nil nil nil nil nil nil t ; maximum-shortest
     ))

(eval `(define-derived-mode cedille-mode
  ,(if (fboundp 'prog-mode) 'prog-mode)
  "Cedille"
  "Major mode for Cedille files."

 (set-input-method "Cedille")
 (mapc (lambda (pair) (quail-defrule (car pair) (cadr pair) "Cedille"))
	'(("\\l" "λ") ("\\>" "→") ("\\r" "→") ("\\R" "⇒") ("\\a" "∀") ("\\m" "✓") ("\\B" "□") ("\\P" "Π") ("\\i" "ι") 
          ("\\t" "★") ("\\o" "☆") ("\\." "·") ("\\x" "ξ") ("\\f" "⇐") ("\\s" "∈") ("\\n" "ν") ("\\u" "↑") ("\\U" "𝓤") ("\\:" "∷")
          ("\\e" "η") ("\\h" "●") ("\\k" "𝒌") ("\\c" "χ") ("\\b" "β") ("\\d" "δ") ("\\z" "ζ") ("\\<" "〈")("\\>" "〉")))
))

(provide 'cedille-mode)
;;; cedille-mode.el ends here
