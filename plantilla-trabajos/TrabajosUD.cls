\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{TrabajosUD}[2022/03/16 TrabajosUD]

% Configuración del documento
\LoadClass[letterpaper,11pt]{article} % Cargar una clase base (p. ej., article, book, report)

% Paquetes necesarios
\RequirePackage[spanish,es-tabla]{babel}
\RequirePackage[top=2cm,bottom=2cm,right=2cm,left=2cm]{geometry}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{empheq}
\RequirePackage{mdframed}
\RequirePackage{booktabs}
\RequirePackage{lipsum}
\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage{psfrag}
\RequirePackage{pgfplots}
\RequirePackage{bm}
\RequirePackage{multicol}
\RequirePackage{wrapfig}
\RequirePackage{float}
\RequirePackage{wrapfig}
\RequirePackage{multirow}
\RequirePackage{biblatex}
\RequirePackage{csquotes}
\RequirePackage{parskip}
\RequirePackage{cancel}
\RequirePackage{listing}
\RequirePackage{tikz}
\RequirePackage{verbatim}
\RequirePackage{subcaption}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{xfrac}
\RequirePackage[load-configurations = abbreviations]{siunitx}
\RequirePackage{fix-cm}
\RequirePackage{yhmath}
\RequirePackage[bookmarks=true,colorlinks=true,linkcolor=black,citecolor=black,menucolor=black,urlcolor=black,hidelinks,breaklinks=true]{hyperref}
\RequirePackage{mathrsfs}
\RequirePackage{tcolorbox}
\RequirePackage{amsfonts}
\RequirePackage[bb=ams]{mathalpha}
\RequirePackage{mathrsfs}
\RequirePackage{xstring}

\RequirePackage{environ}
\RequirePackage{etoolbox}

% \RequirePackage{svg}

% Definir colores
% \RequirePackage{xcolor}
% \definecolor{miColorPrincipal}{RGB}{0,128,255}
% \definecolor{miColorSecundario}{RGB}{255,128,0}

%%%%%%%%%%%%%%%%%%%
% Configuraciones iniciales

\graphicspath{{img/}}
\addbibresource{biblio.bib}
\usepgfplotslibrary{colorbrewer}
\pgfplotsset{width=8cm,compat=1.9}
\definecolor{negro}{RGB}{0,0,0}
\definecolor{azul}{RGB}{0,0,255}
\definecolor{verde}{RGB}{0,255,0}
\definecolor{cian}{RGB}{0,255,255}
\definecolor{rojo}{RGB}{255,0,0}
\definecolor{magenta}{RGB}{255,0,255}
\definecolor{amarillo}{RGB}{255,255,0}
\definecolor{blanco}{RGB}{255,255,255}

\definecolor{limegreen}{cmyk}{0.75,0,1,0}
\definecolor{orange}{cmyk}{0,0.8,0.95,0}
\definecolor{purple}{cmyk}{0.75,1,0,0}

\newcommand{\uvec}[1]{~ \boldsymbol{\hat{\textbf{#1}}}}

\newsavebox\foobox
\newlength{\foodim}
\newcommand{\slantbox}[2][0]{\mbox{%
        \sbox{\foobox}{#2}%
        \foodim=#1\wd\foobox
        \hskip \wd\foobox
        \hskip -0.5\foodim
        \pdfsave
        \pdfsetmatrix{1 0 #1 1}%
        \llap{\usebox{\foobox}}%
        \pdfrestore
        \hskip 0.5\foodim
    }}
\def\Laplacesymb{\slantbox[-.45]{$\mathscr{L}$}}
\def\inverseLaplacesymb{\Laplacesymb^{-1}}
\def\Fouriersymb{\slantbox[-.45]{$\mathscr{F}$}}
\def\Fouriersinsymb{\Fouriersymb_{\textup{s}}}
\def\Fouriercossymb{\Fouriersymb_{\textup{c}}}
\def\inverseFouriersymb{\Fouriersymb^{-1}}

\newcommand{\Laplace}[2]{
    \IfEqCase{#1}{
        {}{\Laplacesymb\left\lbrace#2\right\rbrace}
            {i}{\inverseLaplacesymb\left\lbrace#2\right\rbrace}
    }[\PackageError{tree}{Undefined option to tree: #1}{}]
}
\newcommand{\Fourier}[2]{
    \IfEqCase{#1}{
        {}{\Fouriersymb\left\lbrace#2\right\rbrace}
            {i}{\inverseFouriersymb\left\lbrace#2\right\rbrace}
            {sin}{\Fouriersinsymb\left\lbrace#2\right\rbrace}
            {cos}{\Fouriercossymb\left\lbrace#2\right\rbrace}
    }[\PackageError{tree}{Undefined option to tree: #1}{}]
}

\sisetup{
    detect-family,
    per-mode = symbol,
    separate-uncertainty = true,
    inter-unit-product = \cdot,
    %output-decimal-marker = {,},
    %exponent-product = \cdot
}

\newtoggle{contenidoatoggle}
\newtoggle{contenidortoggle}

\newcommand{\resumencommand}{
    \iftoggle{contenidortoggle}{\begin{center} \Large \textbf{Resumen} \end{center} \vspace*{2pt}

        \hspace{12pt}\begin{minipage}[H]{0.95\textwidth}

            \contenidor

        \end{minipage}

        \hspace{11.5pt}\textbf{Palabras clave:} <<Texto>>

        \iftoggle{contenidoatoggle}{}{\centerline{\rule{0.95\textwidth}{0.4pt}}
            \vspace{15pt}}
    }{}
}

\newcommand{\abstractcommand}{
    \iftoggle{contenidoatoggle}{\begin{center} \Large \textbf{Abstract} \end{center}

        \hspace{12pt}\begin{minipage}[H]{0.95\textwidth}

            \contenidoa

        \end{minipage}

        \hspace{11.5pt}\textbf{Keywords:} <<Text>>

        \iftoggle{contenidortoggle}{}{\centerline{\rule{0.95\textwidth}{0.4pt}}
            \vspace{15pt}}
    }{}
}

\NewEnviron{resumen}{
    \global\newcommand{\contenidor}{\BODY}
    \ifstrempty{\contenidor}{\togglefalse{contenidortoggle}}{
        \toggletrue{contenidortoggle}
        \resumencommand
    }
}

\NewEnviron{abs}{
    \global\newcommand{\contenidoa}{\BODY}
    \ifstrempty{\contenidoa}{\togglefalse{contenidoatoggle}}{
        \toggletrue{contenidoatoggle}
        \abstractcommand
    }
}

%%%%%%%%%%%%%%%%%%%

% Variables
\newcommand{\titulocls}{Título por defecto}
\newcommand{\autorcls}{Autor por defecto}
\newcommand{\cursocls}{Curso por defecto}
\newcommand{\fechacls}{Fecha por defecto}

% Comandos para configuraciones
\newcommand{\configurarEstilo}{%
    \pagestyle{empty} % Sin números de página
    \setlength{\parindent}{0pt} % Sin sangrías
    % Otras configuraciones personalizadas que desees agregar
}

% Comandos para autor y título con valores predeterminados
% Para el comando \titulo
\newcommand{\titulo}[1]{%
    \ifx\relax#1\relax%
        \renewcommand{\titulocls}{Ponga el título pues mijo}%
    \else%
        \renewcommand{\titulocls}{#1}%
    \fi%
}

% Para el comando \autor
\newcommand{\autor}[1]{%
    \ifx\relax#1\relax%
        \renewcommand{\autorcls}{Ponga el autor pues mijo}%
    \else%
        \renewcommand{\autorcls}{#1}%
    \fi%
}

% Para el comando \curso
\newcommand{\curso}[1]{%
    \ifx\relax#1\relax%
        \renewcommand{\cursocls}{Ponga el curso pues mijo}%
    \else%
        \renewcommand{\cursocls}{#1}%
    \fi%
}

% Para el comando \fecha
\newcommand{\fecha}[1]{%
    \ifx\relax#1\relax%
        \renewcommand{\fechacls}{Ponga la fecha pues mijo}%
    \else%
        \renewcommand{\fechacls}{#1}%
    \fi%
}


\DeclareOption{opcion}{
    % Contenido con comandos
    \AtBeginDocument{
        \onecolumn\begin{@twocolumntrue}
            \begin{minipage}{0.3\textwidth}{\includegraphics[width=\textwidth]{src/Escudo_UD.pdf}}
            \end{minipage}
            \vspace{10pt}
            \begin{minipage}{0.677\textwidth}
                \begin{center}
                    \vspace{12mm}

                    \Large{\textbf{\titulocls}}
                    \vspace{3mm}

                    \large{\textbf{\autorcls}}
                    \vspace{2mm}

                    \large{\cursocls} \\ \normalsize{Programa Académico de Física}\\
                    \small{Universidad Distrital Francisco José de Caldas}
                    \vspace{1mm}

                    \normalsize{\fechacls} % Formato (mes) de (año)
                \end{center}
                \vspace{5pt}
            \end{minipage}

            \centerline{\rule{0.95\textwidth}{0.4pt}} % Línea negra
        \end{@twocolumntrue}
    }
}

% Procesa las opciones proporcionadas al cargar la clase
\ProcessOptions\relax

\endinput
