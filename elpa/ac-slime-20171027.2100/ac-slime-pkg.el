;; -*- no-byte-compile: t; lexical-binding: nil -*-
(define-package "ac-slime" "20171027.2100"
  "An auto-complete source using slime completions."
  '((auto-complete "1.4")
    (slime         "2.9")
    (cl-lib        "0.5"))
  :url "https://github.com/purcell/ac-slime"
  :commit "a91f664510d3da24b02e87e4aa59d049483a6529"
  :revdesc "a91f664510d3"
  :authors '(("Steve Purcell" . "steve@sanityinc.com"))
  :maintainers '(("Steve Purcell" . "steve@sanityinc.com")))
