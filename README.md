# Folia

**Procedural botanical page borders in pure TikZ.**

Folia draws blue flowers, veined leaves, buds, curling branches, and small gold
accents around a LaTeX document. It explores the illustrated manuscript border in
[this r/LaTeX post](https://www.reddit.com/r/LaTeX/comments/1xixznw/how_do_you_make_these_flowers_in_latex/).
The artwork is generated from editable TikZ paths, with a seed controlling the
variation from page to page.

<p align="center">
  <a href="docs/examples/resume.pdf"><img src="docs/images/resume-page-1.png" alt="A fictional résumé with a blue floral TikZ border along the left and bottom margins" width="560"></a>
</p>

[View the two-page PDF](docs/examples/resume.pdf) ·
[Example source](floral-manuscript/main.tex) ·
[Package guide](floral-manuscript/README.md)

## Build the example

Use **pdfLaTeX** with a current TeX distribution containing PGF/TikZ. The example
also uses Latin Modern, `geometry`, `microtype`, and `hyperref`. No Lua code,
external artwork, Python, network access, or shell escape is needed to build it.

```sh
git clone https://github.com/pgerhardt/folia.git
cd folia
sh floral-manuscript/build.sh
```

Open `floral-manuscript/sample-resume.pdf`. The script runs pdfLaTeX twice so
TikZ's remembered page coordinates settle. The names, biography, and achievements
in the sample résumé are fictional.

To compile manually, run these commands from `floral-manuscript/`:

```sh
pdflatex -no-shell-escape main.tex
pdflatex -no-shell-escape main.tex
```

## Use in your document

Copy `floralmanuscript.sty` beside your `.tex` file, reserve room for the border,
and load the package:

```tex
\documentclass[11pt,a4paper]{article}
\usepackage[left=51mm,right=21mm,top=25mm,bottom=33mm]{geometry}
\usepackage{floralmanuscript}
\FloralSetup{seed=314159,paper=true}

\begin{document}
\section*{A page in bloom}
Your document supplies the text and typography; the package draws the border.
\end{document}
```

The package does not change fonts, margins, page numbering, or page style.

## What varies

The seed and physical page count control vine phase, branch angles, leaf sizes
and tones, blossom positions, petal families, and small gold accents. Flowers
use broad eight-petal or narrow twelve-petal corollas with smaller inner petals.
Leaves have curved outlines and fine veins; buds, sprays, and a lower garland
complete the border.

A fixed seed and page sequence reproduce the same composition. Changing the seed
changes the artwork. Resetting printed page numbers does not reset the physical
page counter, so consecutive pages can carry different borders even when their
printed numbers match.

<img src="docs/images/resume-page-2.png" alt="Second page of the sample résumé, showing a different seeded floral border" width="560">

## Controls

| Setting | Effect |
| --- | --- |
| `\FloralSetup{seed=271828}` | Choose another composition; use a positive integer from 1 to 1,000,000 |
| `\FloralSetup{paper=false}` | Omit the ivory background |
| `\FloralOff` | Disable the border and background |
| `\FloralOn` | Enable the border again |

Redefine `FloralInk`, `FloralBlue`, `FloralPale`, `FloralGold`, and `FloralPaper`
to change colors. See the [package guide](floral-manuscript/README.md) for an
example and instructions for changing settings between pages.

## Layout limits

This is a border for reserved margins. It uses the paper dimensions, but does not
measure the text or fill empty regions below a paragraph. Keep body text to the
right of 44 mm from the left edge and above 30 mm from the bottom edge. The A4
example's 51/21/25/33 mm margins provide clearance. Check custom headers, footers,
and page sizes in the rendered PDF.

Borders stay on the left rather than mirroring to the outer edge of a two-sided
document. Small gold stars are decorative. The drawing has deliberately repeated
structures, and some secondary stems may look detached at close inspection.

## Source

The package is contained in [one `.sty` file](floral-manuscript/floralmanuscript.sty).
The [example](floral-manuscript/main.tex) supplies the résumé content and layout;
[build.sh](floral-manuscript/build.sh) supplies the two-pass pdfLaTeX build.

MIT licensed. See [LICENSE](LICENSE).
