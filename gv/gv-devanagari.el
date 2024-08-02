;;; gv-devanagari.el --- setup org
;;; Commentary:
;;; sets up devanagri->latin

;;; Code:

(quail-define-package
 "devanagari-translit" "Input method for inputing devanagari transliteration" "DevLAT" t
 "Devanagari transliteration to latin"
 nil t nil nil t nil nil nil nil nil t)

(quail-define-rules
 ;; macrons
 ("aa" ?ā) ("ee" ?ē)("ii" ?ī) ("oo" ?ō) ("uu" ?ū)
 ;; retroflex
 (".t" ?ṭ) (".d" ?ḍ) (".h" ?ḥ)
 ;; nasals
 ("N" ?ṅ) ("nn" ?ñ) (".n" ?ṇ) (".m" ?ṃ)
 ;; sibilants
 ("S" ?ś) (".s" ?ṣ)
 ;; semivowel vowels
 (".l" ?ḷ) (".r" ?ṛ) (".L" ?ḹ) (".R" ?ṝ)
 ;; special
 ("\\\\" ?√))

(provide 'gv-devanagari)
;;; gv-org.el ends here
