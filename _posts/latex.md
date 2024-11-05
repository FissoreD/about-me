---
title: "Latex"
image:
  path: /assets/img/logo_latex.png
...

A latex report template is here : [link](../../assets/lib/TemplateReport2.zip)

A latex presentation template is here : [link](../../assets/lib/TemplatePres1.zip)

## Graphics and images
```tex
\begin{figure}[!htb]
  \centering
  \begin{subfigure}[b]{0.25\textwidth}
    \includegraphics[width=\textwidth]{YOUR IMAGE PATH}
    \caption{Caption 1}
    \label{fig:Label1}
  \end{subfigure}
  \begin{subfigure}[b]{0.25\textwidth}
    \includegraphics[width=\textwidth]{YOUR IMAGE PATH}
    \caption{Caption 2}
    \label{fig:Label2}
  \end{subfigure}
  \caption{Global caption}
  \label{fig:GlobalLabel}
\end{figure}
```

## Create graphs in Latex (With .DOT files)
In header: `\usepackage{tikz}`

Install `dot2tex` in your machine (see [this](https://dot2tex.readthedocs.io/en/latest/installation_guide.html)).
Then run the command on a dot file and it will transform it in a `tikzpicture`.
To resize a `tikzpicture` :
```tex
\begin{tikzpicture}[>=latex',line join=bevel,scale=0.5]
```

## Inline image
```latex
$\begin{array}{l}
  \includegraphics[height=0.5cm]{Your Image}
\end{array}$
```

## Columns
```tex
\begin{columns}
  \begin{column}{0.6\textwidth}
    Some content
  \end{column}
  \begin{column}{0.4\textwidth}
    Some content
  \end{column}
\end{columns}
```

## Table

```tex
\begin{tabular}{|lc|}
  \hline
  C11        & C12    \\
  C21        & C22    \\
  C31        & C32    \\
  \hline
\end{tabular}
```

A table generator in this [Link](https://www.tablesgenerator.com/)

- Multicolumn: `\multicolumn{2}{c}{TXT}`
- Multirow: `\multirow{2}{*}{TXT}`
  [Note: add `\usepackage{multirow}` in header]

## Algorithms
In header:

1. `\usepackage[linesnumbered,ruled]{algorithm2e}`
2. `\usepackage{mathtools}`

> Note: Math Symbols are rendered correctly

Example:
```tex
\begin{algorithm}[H]
  \caption{Angluin L* algorithm}
  \label{L_star_algo}
  \KwIn{$\Sigma$}
  \KwOut{$A \text{ such that } L(A) = U$}
  $S \gets \{\E\}, E \gets \{\E\}, T \gets \text{new Dict()}$\;
  \While{$True$}{
    \If{$(S,E,T) \text{ is not complete}$}{
      $complete(S,E,T) \text{ with membership queries}$\;
    }
    \uIf{$(S, E, T) \text{ is not closed}$}{
      BLA\;
    }
    \uElseIf{$(S,E,T) \text{ is not consistent}$}{
      BLA\;
    }
    \Else{
      BLA\;
      \uIf{$\text{teacherAnswer is a counter example t}$}{
        \For{$p \in Pref(t)$}{
          BLA\;
        }
      }
      \Else{
        \Return A \tcp*{The Teacher accepted the automaton}
      }
    }
  }
\end{algorithm}
```

## Minted

In header: `\usepackage[outputdir=.aux]{minted}`

> `[outputdir=.aux]` is the optional argument telling minted where to
> put the compiled files. Note that this requires to pass the option
> `--output-directory=.aux` to be passed. 
{: .prompt-tip }

> To compile with minted, you need to pass the argument `--shell-escape`.
> When sending conference paper, the CI may not use `--shell-escape`, to overcome this
> issue, follow [this](https://github.com/gpoore/minted/issues/113). Essentially,
> you build once the project with `--shell-escape` and the flag `finalizecache`
> in the `\usepackage[finalizecache]{minted}`, then the source code to send
> should have the flag `frozencache`, like this: `\usepackage[frozencache]{minted}`
{: .prompt-tip }


## Miscellaneous

In the table of content (TOC) if you put a `*` after the section, it will not be considered
Example:
```tex
\section*{Introduction}
```
Introduction will not be in the TOC

---

Rotate text :
```latex
\usepackage{rotating}
\begin{turn}{90}
  Text
\end{turn}
```

## Compile with bibliography

To set the out folder. (Note: If you use *mint* for algorithms, remember to include
`\usepackage[outputdir=.aux]{minted}`)

1. `pdflatex -synctex=1 -interaction=nonstopmode --shell-escape %.tex
   -output-directory .aux`
2. `biber --output_directory .aux %`


## Beamer

Element appears after x : `uncover<2->{YOUR-ELEMENT}`
For list (*enumerate* or *itemize*) : `[<+->]` every item appears in a new slide

---

To put a content in multiple pages
```tex
 \begin{frame}[allowframebreaks]{Title}
```