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
bottom edge. A thin upper rule and a small gold star complete the page head.
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

The structural stem curves, focal flower locations, and gold accents are fixed.
Variation changes the individual plants within that composition: leaf angles,
proportions and colors, petal shapes, wash details, and fine spray branches.
The package uses a private deterministic arithmetic function. It neither seeds
nor consumes PGF's random-number stream, including during grouped shipouts.

## Botanical drawing

The border combines broad five-petalled corollas, compound umbels, meadow-flower
sprays, lobed acanthus-like leaves, and narrower drooping blades. Branch origins
are sampled from the actual cubic stems so secondary growth stays attached.
Clipped translucent washes, darker ink pools, pale veins, and hatching remain
editable vector paths. One framed star and a few small gold marks punctuate
the blue foliage.

The major composition is authored in `\FM@border` and `\FM@footer` in the package
source. Each `\FM@axis` segment supplies three attachment coordinates; adjust
those curves and the motif calls to redesign the border. The sample's left and
bottom clearances remain independent of the artwork.

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
