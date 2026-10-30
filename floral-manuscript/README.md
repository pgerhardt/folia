# Folia package guide

Folia generates a botanical border with TikZ. Compile the sample with pdfLaTeX:

```sh
sh build.sh
```

The result is `sample-resume.pdf`. The script disables shell escape and compiles
twice. To build manually, run `pdflatex -no-shell-escape main.tex` twice.

## Installation

Place `floralmanuscript.sty` beside your document. The package requires PGF/TikZ;
the sample also uses Latin Modern, `geometry`, `microtype`, and `hyperref`.

```tex
\usepackage[left=51mm,right=21mm,top=25mm,bottom=33mm]{geometry}
\usepackage{floralmanuscript}
\FloralSetup{seed=314159,paper=true}
```

No Lua modules, external artwork, or shell escape are required.

## Page layout

Reserve the left and bottom margins yourself. The main border is clipped to
7–44 mm from the left edge, and the lower garland occupies 8–30 mm above the
bottom edge. There is also a thin upper rule and a small upper-right branch.
The package uses the paper dimensions, but does not detect text collisions or
adapt to narrow text margins. Inspect custom page furniture before use.

The sample is two A4 pages. Changing paper size may reflow the résumé onto more
pages. Two runs are needed for remembered page coordinates after a layout change.
The border remains on the physical left side on every page.

## Seed and page sequence

```tex
\FloralSetup{seed=271828}
```

Use a positive integer from 1 to 1,000,000. The generator combines it with the
physical sheet number. Resetting the printed page counter does not repeat the
ornament, and disabled pages still advance the physical sheet count. Inserting
a page earlier in the document changes the patterns on later physical pages.

The generator uses PGF's random-number machinery. Avoid depending on PGF random
state across shipouts when changing seeds inside TeX groups: the current save and
restore implementation does not preserve every grouping scenario.

## Colors and background

To retain the document's background:

```tex
\FloralSetup{paper=false}
```

To change the palette, redefine colors after loading the package:

```tex
\definecolor{FloralInk}{HTML}{344D3D}
\definecolor{FloralBlue}{HTML}{638264}
\definecolor{FloralPale}{HTML}{DFE8DA}
\definecolor{FloralGold}{HTML}{AA8252}
\definecolor{FloralPaper}{HTML}{FCFAF5}
```

## Enable and disable

Use `\FloralOff` or `\FloralSetup{enabled=false}` to omit the decoration and its
background. Use `\FloralOn` or `\FloralSetup{enabled=true}` to restore it.
Settings are read at shipout, so finish a page before changing the next page:

```tex
First page content.
\clearpage
\FloralOff
An unornamented page.
\clearpage
\FloralOn
Another decorated page.
```

The package leaves your text, fonts, page style, and printed page numbers under
the document's control. The supplied résumé is fictional example content.
