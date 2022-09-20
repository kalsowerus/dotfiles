\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cheatsheet}[2022/07/06 v0.1 Cheatsheet class]
\LoadClass{article}

\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{mathtools}
\usepackage{multirow}

\newlength{\pagemargin}
\setlength{\pagemargin}{10pt}
\usepackage[a4paper,margin=\pagemargin]{geometry}

\usepackage{tikz}
\usetikzlibrary{positioning}

\usepackage{titlesec}
\titlespacing\section{0pt}{0pt plus 2pt minus 2pt}{0pt plus 2pt minus 2pt}
\titlespacing\subsection{0pt}{0pt plus 2pt minus 2pt}{0pt plus 2pt minus 2pt}
\titlespacing\subsubsection{0pt}{0pt plus 2pt minus 2pt}{0pt plus 2pt minus 2pt}

\newlength{\defaultindent}
\setlength{\defaultindent}{5pt}
\setlength{\parindent}{\defaultindent}
\newlength{\innermargin}
\setlength{\innermargin}{3pt}

\newcommand{\hr}{%
    \vspace{\innermargin}%
    \hrule%
    \vspace{\innermargin}%
}
\newcommand{\vr}{%
    \hspace{\innermargin}%
    \vline%
    \hspace{\innermargin}%
}

\newcommand{\code}[1]{\texttt{#1}}

\newlength{\minipagewidth}
\newenvironment{multicols}[2][1]
{%
    \setlength{\minipagewidth}{\textwidth / #1}%
    \newcommand{\colbreak}{%
        \end{minipage}%
        \hspace{\innermargin}%
        \vr%
        \hspace{\innermargin}%
        \noindent%
        \begin{minipage}[t]{\minipagewidth - 4\innermargin - \arrayrulewidth}%
    }%
    \noindent%
    \begin{minipage}[t]{\minipagewidth}%
}{%
    \end{minipage}%
}

\newenvironment{twocols}[1]
{%
    \newcommand{\colbreak}{%
        \end{minipage}%
        \hspace{\innermargin}%
        \vr%
        \hspace{\innermargin}%
        \noindent%
        \begin{minipage}[t]{\textwidth - #1\textwidth - 4\innermargin - \arrayrulewidth}%
    }%
    \noindent%
    \begin{minipage}[t]{#1\textwidth}
}{%
    \end{minipage}%
}
\endinput
