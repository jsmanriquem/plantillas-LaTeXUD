\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{src/plantilla-tg}[2024/07/18 Plantilla para la propuesta de trabajo de grado de la Universidad Distrital Francisco José de Caldas]

% ==============================
% CONFIGURACIONES INICIALES
% ==============================

% Definir comandos para almacenar programa y modalidad
\newcommand{\@programa}{fisica}  % Valor predeterminado
\newcommand{\@modalidad}{monografia}  % Valor predeterminado

% Definir las opciones para programa
\DeclareOption{biologia}{\renewcommand{\@programa}{biologia}}
\DeclareOption{fisica}{\renewcommand{\@programa}{fisica}}
\DeclareOption{matematicas}{\renewcommand{\@programa}{matematicas}}
\DeclareOption{quimica}{\renewcommand{\@programa}{quimica}}

% Definir las opciones para modalidad
\DeclareOption{investigacion}{\renewcommand{\@modalidad}{investigacion}} % Capítulo IV
\DeclareOption{monografia}{\renewcommand{\@modalidad}{monografia}} % Capítulo V
\DeclareOption{articulo}{\renewcommand{\@modalidad}{articulo}} % Capítulo VII
\DeclareOption{emprendimiento}{\renewcommand{\@modalidad}{emprendimiento}} % Capítulo VIII
\DeclareOption{pasantia}{\renewcommand{\@modalidad}{pasantia}} % Capítulo IX

% Opciones de la clase
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Cargar la clase base
\LoadClass[letterpaper,11pt]{article}

% Paquetes requeridos

\RequirePackage[spanish,es-tabla]{babel} % Manejo del lenguaje: español
\RequirePackage{lipsum} % Generación de texto automático
\RequirePackage{hyperref} % Manejo avanzado de citas
\RequirePackage{xstring} % Manejo especial de textos
\RequirePackage{textcase} % Manejo avanzado de textos
\RequirePackage{pgfgantt} % Manejo de diagramas de Gantt
\RequirePackage{xcolor} % Manejo especial de colores
\RequirePackage{colortbl} % Manejo especial de colores para tablas
\RequirePackage{parskip} % Manejo especial de interlineado
\RequirePackage{multicol} % Manejo de múltiples columnas
\RequirePackage{etoolbox} % Manejo de condicionales
\RequirePackage{environ} % Manejo de entornos
\RequirePackage{graphicx} % Manejo de gráficas
\RequirePackage{enumitem} % Manejo de entornos de enumeración e items
\RequirePackage{float} % Manejo de entornos flotantes
\RequirePackage{csquotes} % Manejo avanzado de citas
\RequirePackage[
    left=2cm,
    right=2cm,
    top=2cm,
    bottom=2cm,
    includehead,
    includefoot,
    heightrounded,
    footskip=33.59999pt,
    headheight=89.8119pt
]{geometry} % Define la geometría (diseño) del documento
\RequirePackage[
    style=numeric,           % Estilo numérico para la bibliografía.
    citestyle=numeric,       % Estilo numérico para las citas en el texto.
    sorting=nyt,             % Ordena por Autor, Año, Título.
    sortcites=true,          % Ordena automáticamente múltiples citas en el texto.
    autopunct=true,          % Ajusta puntuación automáticamente.
    autolang=hyphen,         % Detecta idioma y aplica guiones según corresponda.
    hyperref=true,           % Habilita enlaces en las citas/referencias.
    abbreviate=false,        % Usa términos completos en vez de abreviaciones.
    backref=true,            % Indica páginas donde se cita cada referencia.
    backend=biber,           % Usa `biber` para procesar el archivo `.bib`.
    defernumbers=true,       % Numera referencias solo al imprimir la bibliografía.
    giveninits=true,         % Usa iniciales para los nombres de pila.
    maxnames=3,              % Muestra hasta 3 autores antes de usar "et al."
    minnames=1,              % Mínimo de nombres a mostrar antes de "et al."
    maxcitenames=2,          % Máximo de autores en las citas antes de "et al."
    mincitenames=1,          % Mínimo de autores en las citas antes de "et al."
    date=year,               % Muestra solo el año en las referencias.
    isbn=false,              % Oculta el ISBN en las referencias.
    doi=true,                % Muestra el DOI si está disponible.
    url=true,                % Muestra URLs en las referencias.
    eprint=true              % Incluye identificadores ePrint (arXiv, etc.).
]{biblatex} % Define el estilo de la bibliografía

% ==============================
% CONFIGURACIÓN BIBLATEX Y HYPERREF
% ==============================

% BiBLaTeX
\addbibresource{biblio.bib} % Archivo BibTeX para la bibliografía
\defbibheading{bibempty}{}

% Hyperref
\hypersetup{hidelinks,breaklinks=true,bookmarksopen=false}

\setlength{\parindent}{0pt} % Elimina la sangría

% ==============================
% ENCABEZADO Y PIE DE PÁGINA
% ==============================

% Definir encabezado y pie de página

\RequirePackage{fancyhdr}
\pagestyle{fancy}

% Encabezado

\fancyhead[C]{
    \begin{tabular}{@{} m{7cm} | m{\dimexpr\textwidth-7cm-2\tabcolsep\relax} @{}}
        \ifdefstring{\@programa}{fisica}{
            \includegraphics[height=2.5cm]{src/shields/fisica.pdf}
        }{
            \ifdefstring{\@programa}{biologia}{
                \includegraphics[height=2.5cm]{src/shields/biologia.pdf}
            }{
                \ifdefstring{\@programa}{matematicas}{
                    \includegraphics[height=2.5cm]{src/shields/matematicas.pdf}
                }{
                    \ifdefstring{\@programa}{quimica}{
                        \includegraphics[height=2.5cm]{src/shields/quimica.pdf}
                    }{}
                }
            }
        } &
        \minipage{\linewidth}
        {\Large \textbf{Propuesta de trabajo de grado} \\[2.5pt]
        {\small Modalidad: \ifdefstring{\@modalidad}{investigacion}{Investigación, Investigación-Creación, Innovación}{\ifdefstring{\@modalidad}{monografia}{Monografía}{\ifdefstring{\@modalidad}{articulo}{Producción de Artículos Académicos}{\ifdefstring{\@modalidad}{emprendimiento}{Proyecto de Emprendimiento}{\ifdefstring{\@modalidad}{pasantia}{Pasantía}{}}}}}}}
        \endminipage
    \end{tabular}
}
\renewcommand\headrule{} % Sin línea horizontal en el encabezado

% Pie de página

\fancyfoot[R]{\thepage}
\fancyfoot[C]{}
\fancyfoot[L]{\small PBX 57(1)323 9300 Ext. \ifdefstring{\@programa}{fisica}{3807 - 3808}{\ifdefstring{\@programa}{biologia}{3804 - 3805}{\ifdefstring{\@programa}{matematicas}{3002}}{\ifdefstring{\@programa}{quimica}{3810 - 3811}{}}} \\ Edificio administrativo: Cra. 4 N.° 26 D 31, Bogotá D.C., Colombia \\ {\scriptsize\textbf{Acreditación Institucional de Alta Calidad. Resolución No. 023653 del 10 de diciembre de 2021}}}

% ==============================
% PRIMERA PÁGINA: DATOS BÁSICOS Y DE CONTACTO
% ==============================

% Definir variables globales para almacenar el contenido

% Respecto a los autores (estudiantes)
% Autor 1
\newcommand{\autornombree}{}
\newcommand{\autoridentificacionn}{}
\newcommand{\tipoautoridentificacionn}{}
\newcommand{\autorcodigoo}{}
\newcommand{\autorcorreoo}{}
\newcommand{\autorprogramaa}{}
% Autor 2
\newcommand{\autornombreee}{}
\newcommand{\autoridentificacionnn}{}
\newcommand{\tipoautoridentificacionnn}{}
\newcommand{\autorcodigooo}{}
\newcommand{\autorcorreooo}{}
\newcommand{\autorprogramaaa}{}

% Respecto a los directores (docentes)
% Director
\newcommand{\dirnombre}{}
\newcommand{\diridentificacion}{}
\newcommand{\tipodiridentificacion}{}
\newcommand{\dircodigo}{}
\newcommand{\dircorreo}{}
\newcommand{\dirprograma}{}
% Codirector
\newcommand{\codirnombre}{}
\newcommand{\codiridentificacion}{}
\newcommand{\tipocodiridentificacion}{}
\newcommand{\codircorreo}{}
\newcommand{\codirprograma}{}

% Función para convertir en false o true
\newcommand{\setglobaltrue}[1]{\global\booltrue{#1}}
\newcommand{\setglobalfalse}[1]{\global\boolfalse{#1}}

% Variables booleanas
\newbool{coautor}
\setglobalfalse{coautor}
\newbool{codirector}
\setglobalfalse{codirector}

% Comando para establecer el valor en una variable global: autores
% Autor 1
\newcommand{\setautornombree}[1]{\global\def\autornombree{#1}}
\newcommand{\setautoridentificacionn}[1]{\global\def\autoridentificacionn{#1}}
\newcommand{\settipoautoridentificacionn}[1]{\global\def\tipoautoridentificacionn{#1}}
\newcommand{\setautorcodigoo}[1]{\global\def\autorcodigoo{#1}}
\newcommand{\setautorcorreoo}[1]{\global\def\autorcorreoo{#1}}
\newcommand{\setautorprogramaa}[1]{\global\def\autorprogramaa{#1}}
% Autor 2
\newcommand{\setautornombreee}[1]{\global\def\autornombreee{#1}}
\newcommand{\setautoridentificacionnn}[1]{\global\def\autoridentificacionnn{#1}}
\newcommand{\settipoautoridentificacionnn}[1]{\global\def\tipoautoridentificacionnn{#1}}
\newcommand{\setautorcodigooo}[1]{\global\def\autorcodigooo{#1}}
\newcommand{\setautorcorreooo}[1]{\global\def\autorcorreooo{#1}}
\newcommand{\setautorprogramaaa}[1]{\global\def\autorprogramaaa{#1}}

% Comando para establecer el valor en una variable global: directores
% Director
\newcommand{\setdirnombre}[1]{\global\def\dirnombre{#1}}
\newcommand{\setdiridentificacion}[1]{\global\def\diridentificacion{#1}}
\newcommand{\settipodiridentificacion}[1]{\global\def\tipodiridentificacion{#1}}
\newcommand{\setdircorreo}[1]{\global\def\dircorreo{#1}}
\newcommand{\setdirprograma}[1]{\global\def\dirprograma{#1}}
% Codirector
\newcommand{\setcodirnombre}[1]{\global\def\codirnombre{#1}}
\newcommand{\setcodiridentificacion}[1]{\global\def\codiridentificacion{#1}}
\newcommand{\settipocodiridentificacion}[1]{\global\def\tipocodiridentificacion{#1}}
\newcommand{\setcodircorreo}[1]{\global\def\codircorreo{#1}}
\newcommand{\setcodirprograma}[1]{\global\def\codirprograma{#1}}


% Entornos de llenado de datos básicos
% Entornos para los autores
\NewEnviron{autor1}{%
    \def\nombre##1{\setautornombree{##1}}%
    \def\identificacion##1##2{\setautoridentificacionn{##2}\settipoautoridentificacionn{##1}}%
    \def\codigo##1{\setautorcodigoo{##1}}%
    \def\correo##1{\setautorcorreoo{##1}}%
    \def\programa##1{\setautorprogramaa{##1}}%
    \BODY
}
\NewEnviron{autor2}{%
    \def\nombre##1{\setautornombreee{##1}}%
    \def\identificacion##1##2{\setautoridentificacionnn{##2}\settipoautoridentificacionnn{##1}}%
    \def\codigo##1{\setautorcodigooo{##1}}%
    \def\correo##1{\setautorcorreooo{##1}}%
    \def\programa##1{\setautorprogramaaa{##1}}%
    \BODY
    \setglobaltrue{coautor}
}

% Entornos para los directores
\NewEnviron{director}{%
    \def\nombre##1{\setdirnombre{##1}}%
    \def\identificacion##1##2{\setdiridentificacion{##2}\settipodiridentificacion{##1}}%
    \def\correo##1{\setdircorreo{##1}}%
    \def\vinculacion##1{\setdirprograma{##1}}%
    \BODY
}
\NewEnviron{codirector}{%
    \def\nombre##1{\setcodirnombre{##1}}%
    \def\identificacion##1##2{\setcodiridentificacion{##2}\settipocodiridentificacion{##1}}%
    \def\correo##1{\setcodircorreo{##1}}%
    \def\vinculacion##1{\setcodirprograma{##1}}%
    \BODY
    \setglobaltrue{codirector}
}

% Fecha
\newcommand{\dayy}{} % Día
\newcommand{\monthh}{} % Mes
\newcommand{\yearr}{} % Año
% Comandos para guardar la fecha
\newcommand{\setday}[1]{\global\def\dayy{#1}}
\newcommand{\setmonth}[1]{\global\def\monthh{#1}}
\newcommand{\setyear}[1]{\global\def\yearr{#1}}

% Entorno de configuración de la fecha
\NewEnviron{fecha}{%
    \def\day##1{\setday{##1}}%
    \def\month##1{\setmonth{##1}}%
    \def\year##1{\setyear{##1}}%
    \BODY
}

% ==============================
% ENTORNOS DE LLENADO PARA LA PROPUESTA DE TRABAJO DE GRADO
% ==============================

% Título
\newcommand{\tituloo}{}
\newcommand{\titulo}[1]{\global\def\tituloo{#1}}

% Entornos de la propuesta de trabajo de grado

% Descripción del problema (investigacion)
\NewEnviron{descripcion_del_problema}{\global\expandafter\def\expandafter\descripcion\expandafter{\BODY}}

% Objetivos: general y específicos (investigacion,monografia,articulo,pasantia)
\NewEnviron{objetivo_general}{\global\expandafter\def\expandafter\generall\expandafter{\BODY}}
\NewEnviron{objetivos_especificos}{\global\expandafter\def\expandafter\espe\expandafter{\BODY}}

% Justificación (investigacion,monografia,pasantia)
\NewEnviron{justificacion}{\global\expandafter\def\expandafter\justi\expandafter{\BODY}}

% Cronograma (investigacion,monografia,articulo,pasantia)
% =====
\definecolor{gris}{HTML}{C0C0C0}
% Definir una lista para almacenar los ítems
\def\listaItems{}

% Contador para numerar las actividades
\newcounter{actividadCounter}

% Definir el comando \actividad
\newcommand{\actividad}[3]{%
    \stepcounter{actividadCounter}%
    \protected@edef\@temp{\theactividadCounter}%
    \expandafter\gappto\expandafter\listaItems{%
        \item \ifnum#1=#2
            \textbf{Actividad de la semana #1:}\newline #3%
        \else
            \textbf{Actividad de la semana #1 a la semana #2:}\newline #3%
        \fi
    }%
    \xappto\ganttItems{\noexpand\\ \noexpand\ganttbar{\theactividadCounter}{#1}{#2}}%
}

% Variable para almacenar la lista de actividades
\def\listaActividadesGuardada{}

% Variable para almacenar los elementos del diagrama de Gantt
\def\ganttItems{}

% Definir el entorno cronograma
\NewEnviron{cronograma}{%
    \BODY
    % Modificar \listaActividadesGuardada para que no incluya el entorno enumerate
    \gdef\listaActividadesGuardada{%
        \listaItems
    }
    \gdef\guardargantt{%
        \begin{ganttchart}[hgrid,vgrid,bar height=0.4,y unit chart=0.6cm,bar/.append style={fill=gris}]{1}{32}
            \gantttitle{Semana de presentación de cada actividad para ambos períodos académicos:}{32} \\
            \gantttitlelist{1,...,32}{1}
            \ganttItems
        \end{ganttchart}
    }%
}
% =====

% Presupuesto (investigacion)
\newbool{presu}
\setglobalfalse{presu}
\newcommand{\presupuesto}{\setglobaltrue{presu}}

% Identificación del problema (monografia)
\NewEnviron{identificacion_del_problema}{\global\expandafter\def\expandafter\identificacion\expandafter{\BODY}}

% Plan de trabajo (monografia,articulo,emprendimiento,pasantia)
\NewEnviron{plan_de_trabajo}{\global\expandafter\def\expandafter\plan\expandafter{\BODY}}

% Tipo de artículo de investigación científica, tecnológica, artística, de revisión, de reflexión, reporte de caso o revisión de tema, propuesto, en concordancia con las categorías del Sistema de Indexación Nacional Publindex (artículo de investigación científica o tecnológica, de reflexión o de revisión) y revistas identificadas para tal fin. (articulo)
\newcommand{\tipoo}{}
\newcommand{\tipo}[1]{\global\def\tipoo{#1}}

% Temática asociada al perfil profesional (articulo)
\NewEnviron{tematica_asociada}{\global\expandafter\def\expandafter\tematica\expandafter{\BODY}}

% Problema (emprendimiento,pasantía)
\NewEnviron{problema}{\global\expandafter\def\expandafter\problem\expandafter{\BODY}}

% Descripción de la idea del emprendimiento (emprendimiento)
\NewEnviron{descripcion_de_la_idea}{\global\expandafter\def\expandafter\descripcionidea\expandafter{\BODY}}

% Impacto o alcance esperado (emprendimiento)
\NewEnviron{impacto_o_alcance}{\global\expandafter\def\expandafter\impacto\expandafter{\BODY}}

% Productos de base tecnológica, de innovación o creación esperados (emprendimiento)
\NewEnviron{productos}{\global\expandafter\def\expandafter\products\expandafter{\BODY}}

% Resultados esperados (pasantía)
\NewEnviron{resultados_esperados}{\global\expandafter\def\expandafter\resultados\expandafter{\BODY}}

% Oficio

\newcommand{\print}{ \setlength{\parskip}{0pt}
\vspace{1cm}
\textbf{Universidad Distrital Francisco José de Caldas}

Facultad de Ciencias Matemáticas y Naturales

Programa Académico de \ifdefstring{\@programa}{fisica}{Física}{\ifdefstring{\@programa}{biologia}{Biología}{\ifdefstring{\@programa}{matematicas}{Matemáticas}{\ifdefstring{\@programa}{quimica}{Química}{}}}} \\

\textbf{Bogotá D.C., {\dayy} de {\monthh} de {\yearr}} \\

\textbf{Consejo Curricular del Programa Académico de \ifdefstring{\@programa}{fisica}{Física}{\ifdefstring{\@programa}{biologia}{Biología}{\ifdefstring{\@programa}{matematicas}{Matemáticas}{\ifdefstring{\@programa}{quimica}{Química}{}}}}}

Facultad de Ciencias Matemáticas y Naturales

Universidad Distrital Francisco José de Caldas \\

{\small \textbf{Asunto: Envío de la propuesta de trabajo de grado para aprobación por parte del Consejo Curricular}} \\

Respetados miembros del Consejo Curricular, \\

Reciban un cordial saludo. \\

Por medio de la presente, \ifbool{coautor}{nos permitimos}{me permito} informarles que, en conformidad con el acuerdo 012 de 2022, \textit{``Por el cual se reglamenta el trabajo de grado para los programas de nivel tecnológico y nivel profesional (pregrado) de la Universidad Distrital Francisco José de Caldas''}, \ifbool{coautor}{realizamos}{realizo} entrega formal de \ifbool{coautor}{nuestra}{mi} propuesta de trabajo de grado bajo la modalidad \ifdefstring{\@modalidad}{investigacion}{\textbf{Investigación, Investigación-Creación, Innovación}}{\ifdefstring{\@modalidad}{monografia}{\textbf{Monografía}}{\ifdefstring{\@modalidad}{articulo}{\textbf{Producción de Artículos Académicos}}{\ifdefstring{\@modalidad}{emprendimiento}{\textbf{Proyecto de Emprendimiento}}{\ifdefstring{\@modalidad}{pasantia}{de \textbf{Pasantía}}{}}}}} para su debida evaluación y aprobación. \\

Los datos \ifbool{coautor}{de los suscritos}{del suscrito} y \ifbool{codirector}{del director, junto al codirector}{del director}, son los siguientes: \\

\ifboolexpr{not bool{coautor} and not bool{codirector}}{
    \vspace{-13pt}
    \begin{multicols}{2}
        \noindent
        Estudiante: \vspace{3pt}

        Nombre: \autornombree      \\
        Identificación: \ifdefstring{\tipoautoridentificacionn}{ti}{T.I.}{\ifdefstring{\tipoautoridentificacionn}{ce}{C.E.}{C.C.}} \autoridentificacionn \\
        Código: \autorcodigoo      \\
        Correo: \href{mailto:\autorcorreoo}{\texttt{\autorcorreoo}}      \\
        Programa: \autorprogramaa

        \columnbreak

        \noindent
        Director: \vspace{3pt}

        Nombre: \dirnombre      \\
        Identificación: \ifdefstring{\tipodiridentificacion}{ti}{T.I.}{\ifdefstring{\tipodiridentificacion}{ce}{C.E.}{C.C.}} \diridentificacion \\
        Correo: \href{mailto:\dircorreo}{\texttt{\dircorreo}}      \\
        Vinculación: \dirprograma
    \end{multicols}
}{
    \ifbool{coautor}{
        Estudiantes: \vspace{-10pt}
        \begin{multicols}{2}
            \noindent
            Nombre: \autornombree      \\
            Identificación: \ifdefstring{\tipoautoridentificacionn}{ti}{T.I.}{\ifdefstring{\tipoautoridentificacionn}{ce}{C.E.}{C.C.}} \autoridentificacionn \\
            Código: \autorcodigoo      \\
            Correo: \href{mailto:\autorcorreoo}{\texttt{\autorcorreoo}}      \\
            Programa: \autorprogramaa

            \columnbreak

            \noindent
            Nombre: \autornombreee      \\
            Identificación: \ifdefstring{\tipoautoridentificacionnn}{ti}{T.I.}{\ifdefstring{\tipoautoridentificacionnn}{ce}{C.E.}{C.C.}} \autoridentificacionnn \\
            Código: \autorcodigooo      \\
            Correo: \href{mailto:\autorcorreooo}{\texttt{\autorcorreooo}}      \\
            Programa: \autorprogramaaa
        \end{multicols}
    }{
        Estudiante: \vspace{3pt}

        Nombre: \autornombree      \\
        Identificación: \ifdefstring{\tipoautoridentificacionn}{ti}{T.I.}{\ifdefstring{\tipoautoridentificacionn}{ce}{C.E.}{C.C.}} \autoridentificacionn \\
        Código: \autorcodigoo      \\
        Correo: \href{mailto:\autorcorreoo}{\texttt{\autorcorreoo}}      \\
        Programa: \autorprogramaa
    }
    \ifbool{codirector}{
        \begin{multicols}{2}
            \noindent
            Director: \vspace{3pt}

            Nombre: \dirnombre      \\
            Identificación: \ifdefstring{\tipodiridentificacion}{ti}{T.I.}{\ifdefstring{\tipodiridentificacion}{ce}{C.E.}{C.C.}} \diridentificacion \\
            Correo: \href{mailto:\dircorreo}{\texttt{\dircorreo}}      \\
            Vinculación: \dirprograma

            \columnbreak

            \noindent
            Codirector: \vspace{3pt}

            Nombre: \codirnombre      \\
            Identificación: \ifdefstring{\tipocodiridentificacion}{ti}{T.I.}{\ifdefstring{\tipocodiridentificacion}{ce}{C.E.}{C.C.}} \codiridentificacion \\
            Correo: \href{mailto:\codircorreo}{\texttt{\codircorreo}}      \\
            Vinculación: \codirprograma
        \end{multicols}
    }{
        Director: \vspace{3pt}

        Nombre: \dirnombre      \\
        Identificación: \ifdefstring{\tipodiridentificacion}{ti}{T.I.}{\ifdefstring{\tipodiridentificacion}{ce}{C.E.}{C.C.}} \diridentificacion \\
        Correo: \href{mailto:\dircorreo}{\texttt{\dircorreo}}      \\
        Vinculación: \dirprograma \\
    }
}

\ifdefstring{\@modalidad}{investigacion}{\ifbool{presu}{El trabajo de grado \textbf{sí cuenta con financiación} la cual se encontrará adjunto al formato}{El trabajo de grado \textbf{no cuenta con financiación} por tanto no se adjunta presupuesto alguno}.}{\ifdefstring{\@modalidad}{articulo}{\ifdefstring{\tipoo}{ciencia}{El tipo de artículo académico a presentar es \textbf{artículo de investigación científica o tecnológica}}{\ifdefstring{\tipoo}{revision}{El tipo de artículo académico a presentar es \textbf{artículo de reflexión o de revisión}}{}}.}{\ifdefstring{\@modalidad}{pasantia}{La \textbf{presentación de la institución o Unidad académica/administrativa receptora} la podrá encontrar adjunta al formato}{}}} A continuación, la propuesta de trabajo de grado.

\newpage

% Variaciones dependiendo de la modalidad

\ifdefstring{\@modalidad}{investigacion}{
    \input{modalidad/investigacion.tex}

    \centerline{\rule{\textwidth}{0.4pt}}
    \begin{center}
        \huge\tituloo
    \end{center}
    \centerline{\rule{\textwidth}{0.4pt}}
    \setlength{\parskip}{\baselineskip}
    \section*{Descripción del problema}
    \descripcion
    \section*{Objetivos}
    \subsection*{Objetivo general}
    \generall
    \setlength{\parskip}{0pt}
    \subsection*{Objetivos específicos}
    \begin{itemize}[leftmargin=15pt]
        \espe
    \end{itemize}
    \section*{Justificación}
    \justi
    \section*{Cronograma}
    \setlength{\parskip}{5pt}
    \begin{enumerate}[leftmargin=15pt]
        \listaActividadesGuardada
    \end{enumerate}
    \setlength{\parskip}{\baselineskip}
    El siguiente cronograma se plantea con base en la lista de actividades, así cada actividad está numerada. Este está diseñado como un \textit{diagrama de Gantt}:

    \resizebox{\linewidth}{!}{\guardargantt}
    \nocite{*}
    \section*{Bibliografía}
    \printbibliography[heading=bibempty]
}{\ifdefstring{\@modalidad}{monografia}{
        \input{modalidad/monografia.tex}

        \centerline{\rule{\textwidth}{0.4pt}}
        \begin{center}
            \huge\tituloo
        \end{center}
        \centerline{\rule{\textwidth}{0.4pt}}
        \setlength{\parskip}{\baselineskip}
        \section*{Identificación del problema}
        \identificacion
        \section*{Objetivos de la monografía}
        \subsection*{Objetivo general}
        \generall
        \setlength{\parskip}{0pt}
        \subsection*{Objetivos específicos}
        \begin{itemize}[leftmargin=15pt]
            \espe
        \end{itemize}
        \setlength{\parskip}{\baselineskip}
        \section*{Justificación}
        \justi
        \section*{Plan de trabajo}
        \plan
        \setlength{\parskip}{5pt}
        \subsection*{Actividades acorde al plan de trabajo}
        \begin{enumerate}[leftmargin=15pt]
            \listaActividadesGuardada
        \end{enumerate}
        \setlength{\parskip}{\baselineskip}
        \section*{Cronograma}
        El siguiente cronograma se plantea con base en la lista de actividades presentada en el \textbf{Plan de trabajo}, así cada actividad está numerada. Este está diseñado como un \textit{diagrama de Gantt}:

        \resizebox{\linewidth}{!}{\guardargantt}
        \nocite{*}
        \section*{Bibliografía}
        \printbibliography[heading=bibempty]
    }{\ifdefstring{\@modalidad}{articulo}{
            \input{modalidad/articulo.tex}

            \centerline{\rule{\textwidth}{0.4pt}}
            \begin{center}
                \huge\tituloo
            \end{center}
            \centerline{\rule{\textwidth}{0.4pt}}
            \setlength{\parskip}{\baselineskip}
            \section*{Temática asoaciada al perfil profesional}
            \tematica
            \section*{Objetivos}
            \subsection*{Objetivo general}
            \generall
            \setlength{\parskip}{0pt}
            \subsection*{Objetivos específicos}
            \begin{itemize}[leftmargin=15pt]
                \espe
            \end{itemize}
            \setlength{\parskip}{\baselineskip}
            \section*{Plan de trabajo}
            \plan
            \setlength{\parskip}{5pt}
            \subsection*{Actividades acorde al plan de trabajo}
            \begin{enumerate}[leftmargin=15pt]
                \listaActividadesGuardada
            \end{enumerate}
            \setlength{\parskip}{\baselineskip}
            \section*{Cronograma}
            El siguiente cronograma se plantea con base en la lista de actividades presentada en el \textbf{Plan de trabajo}, así cada actividad está numerada. Este está diseñado como un \textit{diagrama de Gantt}:

            \resizebox{\linewidth}{!}{\guardargantt}
        }{\ifdefstring{\@modalidad}{emprendimiento}{
                \input{modalidad/emprendimiento.tex}

                \centerline{\rule{\textwidth}{0.4pt}}
                \begin{center}
                    \huge\tituloo
                \end{center}
                \centerline{\rule{\textwidth}{0.4pt}}
                \setlength{\parskip}{\baselineskip}
                \section*{Problema}
                \problem
                \section*{Descripción de la idea del emprendimiento}
                \descripcionidea
                \section*{Impacto o alcance esperado}
                \impacto
                \section*{Plan de trabajo}
                \plan
                \section*{Productos de base tecnológica, de innovación o creación esperados}
                \products
                \nocite{*}
                \section*{Bibliografía}
                \printbibliography[heading=bibempty]
            }{\ifdefstring{\@modalidad}{pasantia}{
                    \input{modalidad/pasantia.tex}

                    \centerline{\rule{\textwidth}{0.4pt}}
                    \begin{center}
                        \huge\tituloo
                    \end{center}
                    \centerline{\rule{\textwidth}{0.4pt}}
                    \setlength{\parskip}{\baselineskip}
                    \section*{Problema por resolver}
                    \problem
                    \section*{Justificación}
                    \justi
                    \section*{Objetivos}
                    \subsection*{Objetivo general}
                    \generall
                    \setlength{\parskip}{0pt}
                    \subsection*{Objetivos específicos}
                    \begin{itemize}[leftmargin=15pt]
                        \espe
                    \end{itemize}
                    \setlength{\parskip}{\baselineskip}
                    \section*{Plan de trabajo}
                    \plan
                    \setlength{\parskip}{5pt}
                    \subsection*{Actividades acorde al plan de trabajo}
                    \begin{enumerate}[leftmargin=15pt]
                        \listaActividadesGuardada
                    \end{enumerate}
                    \setlength{\parskip}{\baselineskip}
                    \section*{Resultados esperados}
                    \resultados
                    \section*{Cronograma}
                    El siguiente cronograma se plantea con base en la lista de actividades presentada en el \textbf{Plan de trabajo}, así cada actividad está numerada. Este está diseñado como un \textit{diagrama de Gantt}:

                    \resizebox{\linewidth}{!}{\guardargantt}
                }{}}}}}

\noindent\begin{minipage}{\textwidth}
    Sin otro particular,

    \ifboolexpr{not bool{coautor} and not bool{codirector}}{
        \vspace{80pt}
        \begin{multicols}{2}
            \noindent\rule{0.45\textwidth}{0.4pt} \\
            \autornombree \\
            \ifdefstring{\tipoautoridentificacionn}{ti}{T.I.}{\ifdefstring{\tipoautoridentificacionn}{ce}{C.E.}{C.C.}} \autoridentificacionn

            \columnbreak

            \noindent\rule{0.45\textwidth}{0.4pt} \\
            \dirnombre \\
            \ifdefstring{\tipodiridentificacion}{ti}{T.I.}{\ifdefstring{\tipodiridentificacion}{ce}{C.E.}{C.C.}} \diridentificacion
        \end{multicols}
    }{
        \vspace{80pt}
        \ifbool{coautor}{
            \begin{multicols}{2}
                \noindent\rule{0.45\textwidth}{0.4pt} \\
                \autornombree \\
                \ifdefstring{\tipoautoridentificacionn}{ti}{T.I.}{\ifdefstring{\tipoautoridentificacionn}{ce}{C.E.}{C.C.}} \autoridentificacionn

                \columnbreak

                \noindent\rule{0.45\textwidth}{0.4pt} \\
                \autornombreee \\
                \ifdefstring{\tipoautoridentificacionnn}{ti}{T.I.}{\ifdefstring{\tipoautoridentificacionnn}{ce}{C.E.}{C.C.}} \autoridentificacionnn
            \end{multicols}
        }{
            \noindent\rule{0.45\textwidth}{0.4pt} \\
            \autornombree \\
            \ifdefstring{\tipoautoridentificacionn}{ti}{T.I.}{\ifdefstring{\tipoautoridentificacionn}{ce}{C.E.}{C.C.}} \autoridentificacionn
        }
        \vspace{80pt}
        \ifbool{codirector}{
            \begin{multicols}{2}
                \noindent\rule{0.45\textwidth}{0.4pt} \\
                \dirnombre \\
                \ifdefstring{\tipodiridentificacion}{ti}{T.I.}{\ifdefstring{\tipodiridentificacion}{ce}{C.E.}{C.C.}} \diridentificacion

                \columnbreak

                \noindent\rule{0.45\textwidth}{0.4pt} \\
                \codirnombre \\
                \ifdefstring{\tipocodiridentificacion}{ti}{T.I.}{\ifdefstring{\tipocodiridentificacion}{ce}{C.E.}{C.C.}} \codiridentificacion
            \end{multicols}
        }{
            \noindent\rule{0.45\textwidth}{0.4pt} \\
            \dirnombre \\
            \ifdefstring{\tipodiridentificacion}{ti}{T.I.}{\ifdefstring{\tipodiridentificacion}{ce}{C.E.}{C.C.}} \diridentificacion
        }
    }
\end{minipage}
}