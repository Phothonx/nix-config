# should ~ be the same as texlive + texlive-science + texlive-latex-extra + texlive-pictures + texlive-lang-french form Debian/Ubuntu
ps:
with ps; [
  # Core
  scheme-medium

  # texlive-latex-extra
  geometry
  fancyhdr
  booktabs
  multirow
  enumitem
  titlesec
  todonotes
  xcolor
  hyperref
  cleveref
  stackengine

  # texlive-science
  amsmath
  mathtools
  siunitx
  physics
  chemformula

  # texlive-pictures
  pgf
  tikz-cd
  graphics
  wrapfig
  adjustbox

  # texlive-lang-french
  babel-french
  collection-langfrench
  csquotes
]
