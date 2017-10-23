#!/usr/bin/env bash
# unicode to LaTeX
## 20. transliteration of unicode Greek
## 21. degree symbols
## 22. probably omicron means 0 in subscript
## 23. italic l
## 24. perp
## 25. times
## 26. neq
## 27. \gg \ll
# syntax conversion
## 28. lower and upper scripts
## 29. remove emphasis enclosing dollar sign math
## 30. Emphasis/quote to Math
# Cleanup
## 31-36. move 0-9.+/=- outside math into math, 6 times (this will keep "eating" math-like characters outside math into math. Sometimes it will backfire, like full-stop.)
## 37. merging consecutive dollar sign
## 38. compress repeated spaces
sed -i\
	-e 's/α/ \$\\alpha\$ /g' -e 's/β/ \$\\beta\$ /g' -e 's/ψ/ \$\\psi\$ /g' -e 's/δ/ \$\\delta\$ /g' -e 's/ε/ \$\\epsilon\$ /g' -e 's/φ/ \$\\phi\$ /g' -e 's/γ/ \$\\gamma\$ /g' -e 's/η/ \$\\eta\$ /g' -e 's/ι/ \$\\iota\$ /g' -e 's/ξ/ \$\\xi\$ /g' -e 's/κ/ \$\\kappa\$ /g' -e 's/λ/ \$\\lambda\$ /g' -e 's/[μµ]/ \$\\mu\$ /g' -e 's/ν/ \$\\nu\$ /g' -e 's/π/ \$\\pi\$ /g' -e 's/ρ/ \$\\rho\$ /g' -e 's/σ/ \$\\sigma\$ /g' -e 's/τ/ \$\\tau\$ /g' -e 's/θ/ \$\\theta\$ /g' -e 's/ω/ \$\\omega\$ /g' -e 's/ς/ \$\\varsigma\$ /g' -e 's/χ/ \$\\chi\$ /g' -e 's/υ/ \$\\upsilon\$ /g' -e 's/ζ/ \$\\zeta\$ /g' -e 's/Ψ/ \$\\Psi\$ /g' -e 's/Δ/ \$\\Delta\$ /g' -e 's/Φ/ \$\\Phi\$ /g' -e 's/Γ/ \$\\Gamma\$ /g' -e 's/Ξ/ \$\\Xi\$ /g' -e 's/Λ/ \$\\Lambda\$ /g' -e 's/Π/ \$\\Pi\$ /g' -e 's/Σ/ \$\\Sigma\$ /g' -e 's/Θ/ \$\\Theta\$ /g' -e 's/Ω/ \$\\Omega\$ /g' -e 's/Υ/ \$\\Upsilon\$ /g'\
	-e 's/\([0-9.,]*\)[°º˚]/ \$\\SI{\1}{\\degree}\$ /g'\
	-e 's/ο/ \$_0\$ /g'\
	-e 's// \$l\$ /g'\
	-e 's/⊥/ \$\\perp\$ /g'\
	-e 's/×/ \$\\times\$ /g'\
	-e 's/≠/ \$\\neq\$ /g'\
	-e 's/»/ \$\\gg\$ /g' -e 's/«/ \$\\ll\$ /g'\
	-e 's/\([^ ]*\)~\([^ ~]\+\)~/ \$\1_{\2}\$ /g' -e 's/\([^ ]*\)\^\([^ ^]\+\)\^/ \$\1^{\2}\$ /g'\
	-e 's/\$[[:space:]]*[*]\+/\$/g' -e 's/[*]\+[[:space:]]*\$/\$/g'\
	-e 's/[*"]\+\([^ *"]\)\([[:upper:]]\)[*"]\+/\$\1\2\$/g' -e 's/[*"]\+\([^ *"]\)\([^ *"]\)[*"]\+/\$\1_\2\$/g' -e 's/[*"]\+\([^ *"]\)[*"]\+/\$\1\$/g'\
	-e 's/\([0-9.+/=-]\+\)[[:space:]]\+\$\([^$]\+\)\$/\$\1\2\$/g' -e 's/\$\([^$]\+\)\$[[:space:]]\+\([0-9.+/=-]\+\)/\$\1\2\$/g'\
	-e 's/\([0-9.+/=-]\+\)[[:space:]]\+\$\([^$]\+\)\$/\$\1\2\$/g' -e 's/\$\([^$]\+\)\$[[:space:]]\+\([0-9.+/=-]\+\)/\$\1\2\$/g'\
	-e 's/\([0-9.+/=-]\+\)[[:space:]]\+\$\([^$]\+\)\$/\$\1\2\$/g' -e 's/\$\([^$]\+\)\$[[:space:]]\+\([0-9.+/=-]\+\)/\$\1\2\$/g'\
	-e 's/\([0-9.+/=-]\+\)[[:space:]]\+\$\([^$]\+\)\$/\$\1\2\$/g' -e 's/\$\([^$]\+\)\$[[:space:]]\+\([0-9.+/=-]\+\)/\$\1\2\$/g'\
	-e 's/\([0-9.+/=-]\+\)[[:space:]]\+\$\([^$]\+\)\$/\$\1\2\$/g' -e 's/\$\([^$]\+\)\$[[:space:]]\+\([0-9.+/=-]\+\)/\$\1\2\$/g'\
	-e 's/\([0-9.+/=-]\+\)[[:space:]]\+\$\([^$]\+\)\$/\$\1\2\$/g' -e 's/\$\([^$]\+\)\$[[:space:]]\+\([0-9.+/=-]\+\)/\$\1\2\$/g'\
	-e 's/\$[[:space:]]\+\$//g'\
	-e 's/\$[[:space:]]\+/\$ /g' -e 's/[[:space:]]\+\$/ \$/g'\
	"$@"
