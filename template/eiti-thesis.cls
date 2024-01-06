%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bachelor's & Master's Thesis Template             %%
%% Copyleft by Artur M. Brodzki & Piotr Woźniak      %%
%% Faculty of Electronics and Information Technology %%
%% Warsaw University of Technology, 2019-2020        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{template/eiti-thesis}

\LoadClass[
    12pt,
    twoside
]{mwart}

%--------------------------------------
% Define class parameters
%--------------------------------------
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=template/eiti-thesis.cls,
    prefix=eiti
}

\DeclareStringOption[2.5cm]{left}
\DeclareStringOption[2.5cm]{right}
\DeclareStringOption[2.5cm]{top}
\DeclareStringOption[2.5cm]{bottom}
\DeclareStringOption[6mm]{bindingoffset}
\DeclareBoolOption[false]{nohyphenation}
\ProcessKeyvalOptions*

%--------------------------------
% Common packages
%--------------------------------
\RequirePackage[polish]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[
    protrusion=true,
    expansion=true
]{microtype}
\RequirePackage{array}      % Advanced table column formats
\RequirePackage[            % Bibliography in biber
    backend=biber,
    style=ieee
]{biblatex}
\RequirePackage[            % Custom figure and table captions
    font=small,
    labelfont=bf,
    labelsep=period,
    justification=centering
]{caption}
\RequirePackage{chngcntr}   % Per-section counters
\RequirePackage{enumitem}   % Itemize/enumrate
\RequirePackage{fancyhdr}   % Custom header/footer styles
\RequirePackage{fourier}    % Adobe Utopia font
\RequirePackage{graphicx}   % Enhanced images support
\RequirePackage{pdfpages}
\RequirePackage{float}      % Improved float support
\RequirePackage{lipsum}     % Lorem ipsum
\RequirePackage[outputdir=out]{minted}   % Code listings
\RequirePackage[autostyle,german=guillemets]{csquotes}
\RequirePackage{tcolorbox}
\RequirePackage{etoolbox}
\RequirePackage{xpatch}
\RequirePackage{multicol}   % Multiple columns
\RequirePackage{longtable}  % Multi-page tables
\RequirePackage{setspace}   % Set space between lines
\RequirePackage{scrextend}  % Allows \addmargin environment
\RequirePackage{tocloft}    % Custom ToC/LoF/LoT
\RequirePackage{url}        % URL-sensitive line breaks
\RequirePackage{xkeyval}    % Keys and class parameters
\RequirePackage{xspace}     % Remove duplicated spaces
\RequirePackage{xcolor}     % Colorful text
\RequirePackage[page,header]{appendix}
\RequirePackage{titletoc}  % Custom table of contents ex. appendices


%--------------------------------
% Produce clickable hyperlinks
% in ToC, LoF and LoT
%--------------------------------
\RequirePackage{hyperref}
\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black
}

%--------------------------------------
% Default margin is 2.5 cm
%--------------------------------------
\RequirePackage[
    a4paper,
    left=\eitileft,
    right=\eitiright,
    top=\eititop,
    bottom=\eitibottom,
    bindingoffset=\eitibindingoffset
]{geometry}

%--------------------------------
% Turn off hyphenation
%--------------------------------
\ifeitinohyphenation
    \tolerance=1
    \emergencystretch=\maxdimen
    \hyphenpenalty=10000
    \hbadness=10000
\fi

%--------------------------------
% Initial setup
%--------------------------------
\setstretch{1.2}
\counterwithin{figure}{section}
\counterwithin{listing}{section}
\counterwithin{table}{section}
\raggedbottom

%--------------------------------
% Table of Contents setup
%--------------------------------
\setlength{\cftbeforesecskip}{2pt}
\renewcommand{\cftsecfont}{\bf\normalsize}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftsecdotsep}{\cftdotsep}

%--------------------------------
% List of Figures setup
%--------------------------------
\renewcommand*\l@figure{\@dottedtocline{1}{0.5em}{2.25em}}
\newcommand{\listoffigurestoc}{
    \listoffigures
    \addcontentsline{toc}{section}{\listfigurename}
}

%--------------------------------
% List of Tables setup
%--------------------------------
\renewcommand*\l@table{\@dottedtocline{1}{0.5em}{2.25em}}
\newcommand{\listoftablestoc}{
    \listoftables
    \addcontentsline{toc}{section}{\listtablename}
}

%--------------------------------
% Header & footer
%--------------------------------
\SetSectionFormatting{section}{0.5cm}{\FormatHangHeading{\Large}}{0.5cm}
\let\oldsection\section
\renewcommand{\section}{
	\thispagestyle{plain}
	\oldsection
}

\fancypagestyle{plain}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot[LE,RO]{\thepage}
}

\fancypagestyle{headings}{
	\fancyhead{}
	\renewcommand{\headrulewidth}{1pt}
	\fancyheadoffset{0cm}
	\fancyhead[RO]{\nouppercase{\thesection.\hspace{8pt}\leftmark}}
	\fancyhead[LE]{\nouppercase{\thesection.\hspace{8pt}\leftmark}}
	\fancyfoot{}
	\fancyfoot[LE,RO]{\thepage}
}
\pagestyle{headings}

\renewcommand{\sectionmark}[1]{
	\markboth{#1}{#1}
}

%--------------------------------
% Set default list style
%--------------------------------
\setlist[itemize,1]{topsep=2pt,label=\large$\bullet$, leftmargin=28pt}
\setlist[itemize,2]{topsep=2pt,leftmargin=18pt}
\setlist[itemize,3]{topsep=2pt,leftmargin=18pt}

\setlist[enumerate,1]{topsep=2pt,leftmargin=24pt}
\setlist[enumerate,2]{topsep=2pt,leftmargin=16pt}
\setlist[enumerate,3]{topsep=2pt,leftmargin=16pt}

%--------------------------------
% Język pracy
%--------------------------------

\newtheorem{theorem}{Twierdzenie}
\newtheorem{lemma}{Lemat}
\newtheorem{corollary}{Wniosek}
\newtheorem{definition}{Definicja}
\newtheorem{axiom}{Aksjomat}
\newtheorem{assumption}{Założenie}
\renewcommand{\figureautorefname}{Rysunek}
\renewcommand{\tableautorefname}{Tabela}
\renewcommand{\equationautorefname}{Równanie}
\renewcommand{\chapterautorefname}{Rozdział}
\renewcommand{\appendixautorefname}{Załącznik}
\renewcommand{\sectionautorefname}{Rozdział}
\renewcommand{\subsectionautorefname}{Podrozdział}
\renewcommand{\subsubsectionautorefname}{Podrozdział}
\providecommand*{\listingautorefname}{Listing}
\renewcommand{\appendixtocname}{Spis załączników}
\renewcommand{\appendixpagename}{Spis załączników}

\AtBeginDocument{
    \renewcommand{\listfigurename}{Spis rysunków}
    \renewcommand{\listtablename}{Spis tabel}
    \renewcommand{\tablename}{Tabela}
}

\newcommand\todo[1]{\textcolor{red}{\textbf{TODO}: #1}}

%--------------------------------
% Streszczenie po polsku
%--------------------------------
\newcommand{\streszczenie}{
    \thispagestyle{plain}
    \begin{center}\textbf{\large\@title}\end{center}
    \textbf{\\ Streszczenie.\xspace}
}
\newcommand{\slowakluczowe}{\vspace{0.5cm}\par\noindent \textbf{Słowa kluczowe: \xspace}}

%--------------------------------
% Streszczenie po angielsku
%--------------------------------
\renewcommand{\abstract}{
    \thispagestyle{plain}
    \begin{center}\textbf{\large\@engtitle}\end{center}
    \textbf{\\ Abstract.\xspace}
}
\newcommand{\keywords}{\vspace{0.5cm}\par\noindent \textbf{Keywords: \xspace}}

%--------------------------------
% Strona tytułowa - makra
%--------------------------------
\newcommand{\instytut}[1]{
    \newcommand{\@instytut}{#1}
}
\newcommand{\kierunek}[1]{
    \newcommand{\@kierunek}{#1}
}
\newcommand{\album}[1]{
    \newcommand{\@album}{#1}
}
\newcommand{\promotor}[1]{
    \newcommand{\@promotor}{#1}
}
\newcommand{\engtitle}[1]{
    \newcommand{\@engtitle}{#1}
}

%--------------------------------
% Strona tytułowa
%--------------------------------
\let\oldmaketitle\maketitle
\renewcommand{\maketitle}{
    \linespread{1.15}

    \thispagestyle{empty}
    \pagenumbering{gobble}

    \begin{center}
        %\sffamily
        \includegraphics[width=\textwidth]{template/header} \\
        \hfill \break
        \hfill \break
        Instytut \@instytut \\
        \hfill \break
        \hfill \break
        \hfill \break
        \includegraphics[width=\textwidth]{template/title-inz} \\
        \hfill \break
        na~kierunku \@kierunek \\
        \hfill \break
        \hfill \break
        \large
        \@title \\
        \hfill \break
        \hfill \break
        \LARGE
        \@author \\
        \normalsize
        Numer~albumu \@album \\
        \hfill \break
        \hfill \break
        promotor \\
        \@promotor \\
        \vfill
        WARSZAWA \@date
    \end{center}

    \pagenumbering{arabic}
    \setcounter{page}{1}
}

%--------------------------------
% Pusta strona - makro
%--------------------------------
\newcommand{\blankpage}{
    \newpage
    \thispagestyle{empty}
    \
    \newpage
}

%--------------------------------
% Skrót (akronim) - makro
%--------------------------------
\newcommand{\acronymlist}{
    \section*{Wykaz symboli i skrótów}
}
\newcommand{\acronym}[2]{
    \par\noindent\hspace{0.4em}
    {\textbf{#1} -- #2}
}

%--------------------------------
% fbox
%--------------------------------
\setlength{\fboxsep}{0pt}