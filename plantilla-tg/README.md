# Plantilla: Trabajo de grado UD

¡Hola!, y bienvenido a esta plantilla diseñada para la **presentación de tú propuesta de trabajo de grado**, esta plantilla se divulga con fines netamente educativos y sin ningún fin con ánimo de lucro, así, se prohibe su distribución con tales fines.

Mí nombre es Sebastian Manrique, soy estudiante del Programa Académico de Física de la Universidad Distrital Francisco José de Caldas y soy el creador de esta plantilla, en este archivo `README.md` podrás conocer su instalación y uso. Cualquier duda, queja o crítica constructiva que desees dar para apoyar el continuo desarrollo de la misma o de algunas otras plantillas será muy bien recibido, puedes escribirme directamente a mí correo electrónico institucional de contacto: jsmanriquem@udistrital.edu.co; o realizando un _pull-request_ a este repositorio.

No olvides que **esta plantilla no es oficial** por tanto, para usarla en tú trabajo de grado primero debes ponerte en comunicación con la coordinación de tú programa y solicitar autorización, además, esta plantilla solamente está diseñada para los programas académicos de la Facultad de Ciencias Matemáticas y Naturales de la Universidad Distrital Francisco José de Caldas bajo las siguientes modalidades de trabajo de grado:

- Investigación, Investigación-Creación, Innovación.
- Monografía.
- Producción de Artículos Académicos.
- Proyecto de emprendimiento.
- Pasantía.

> **Nuevo:** la plantilla ahora cuenta con un apartado para que insertes la firma tuya y la de tú director. El documento está diseñado para _firma electrónica_ o en _firma en físico_, así que no podrás agregar la firma en archivo `.tex` principal.

Espero disfrutes esta plantilla y aprendas un poco sobre $\LaTeX$ algo más avanzado al habitual, no siendo más te dejo con su instalación y guía de uso.

## Instalación

Para instalar esta plantilla y poder usarla, dirígete directamente al _release_ asociado a ella aquí: [plantilla-tg.zip](https://github.com/jsmanriquem/plantillas-LaTeXUD/releases/tag/plantilla-tg). Sigue los pasos que encuentras ahí mismo y listo.

## Guía de uso

### Manejo del archivo principal `plantilla.tex`

Tras haber instalado la plantilla y poder editarla para usarla, debes entrar en el archivo principal llamado `plantilla.tex`, ahí encontrarás diversos comentarios para poder llenar los datos como: _programa_ y _modalidad_; también los datos básicos del autor o autores (en caso de ser el máximo de dos autores) y director junto al codirector (también, en caso de requerirlo). Igualmente acá podrá encontrar un poco más desarrollado este apartado:

#### Selección del programa y la modalidad

Al principio del archivo encontrarás:

```TeX
\documentclass[fisica,monografia]{src/plantilla-tg}
```

De acá, se llenarán dos apartados, el primero relacionado al programa y el segundo relacionado a la modalidad en la que vas a entregar la propuesta de trabajo de grado, para ello debes seguir las siguiente convenciones:

En el caso del apartado _programa_:

- `biologia`: refiere al Programa Académico de Biología.
- `fisica`: refiere al Programa Académico de Física.
- `matematicas`: refiere al Programa Académico de Matemáticas.
- `quimica`: refiere al Programa Académico de Química.

Luego, en el apartado _modalidad_:

- `investigacion`: Investigación, Investigación-Creación, Innovación.
- `monografia`: Monografía.
- `articulo`: Producción de Artículos Académicos.
- `emprendimiento`: Proyecto de emprendimiento.
- `pasantia`: Pasantía.

Modificando esa línea de código podrás elegir tú carrera y la modalidad, esto se actualizará automáticamente en todo el documento.

#### La fecha de entrega

La fecha de entrega del documento debes llenarla en el siguiente entorno:

```TeX
\begin{fecha}
    \day{26} % Día
    \month{agosto} % Mes
    \year{2024} % Año
\end{fecha}
```

Acá debes hacer el llenado estrictamente de la siguiente forma: para el día, debes colocarlo en números únicamente indicando el día del mes en el que lo entregas; para el mes, debes colocarlo en texto únicamente indicando el nombre del mes en el que lo entregas; finalmente el año, debes colocarlo con el mismo formato que el día.

#### Datos básicos: autores

Para el llenado de los datos básicos de los autores se tiene la siguiente estructura:

```TeX
\begin{autor1}
    \nombre{Sebastian Manrique}
    \identificacion{}{123456}
    \codigo{123456789}
    \correo{jsmanriquem@udistrital.edu.co}
    \programa{Física}
\end{autor1}
```

Cada uno de los datos de los autores se llenan en `autor1` y `autor2` para el primer autor y el segundo autor (si lo hay) respectivamente. A continuación te explico cada uno de sus apartados:

1. `\nombre`: acá debes llenar el nombre completo del autor, se sugiere que sean primero los nombres y luego los apellidos.
2. `\identificacion`: acá tenemos dos corchetes para llenar, en el primer corchete llenamos el _tipo de identificación_ bajo las siguiente convenciones:
   - `ti`: refiere al tipo de documento, Tarjeta de Identidad.
   - `ce`: refiere al tipo de documento, Cédula de Extranjería.
   - vacío o por defecto: refiere al tipo de documento, Cédula de Ciudadanía.
     Luego, en el segundo corchete debes colocar el número de identificación.
3. `\codigo`: acá debes llenar el código estudiantil del autor.
4. `\correo`: acá debes llenar el correo institucional del autor.
5. `\programa`: finalmente, acá debes indicar el programa al que pertenece, como sugerencia simplemente escribe el nombre del programa, por ejemplo, en el caso del Programa Académico de Física colocar solamente _Física_.

#### Datos básicos: director y codirector

Para el llenado de los datos básicos del director y el codirector se tiene la siguiente estructura:

```TeX
\begin{director}
    \nombre{Juan Moreno}
    \identificacion{}{123456789}
    \correo{director@universidad.edu.co}
    \vinculacion{Su universidad o facultad}
\end{director}
```

Cada uno de los datos del director y el codirector (si lo hay) se llenan en `director` y `codirector` respectivamente. A continuación te explico cada uno de sus apartados:

1. `\nombre`: acá debes llenar el nombre completo del director o codirector, se sugiere que sean primero los nombres y luego los apellidos.
2. `\identificacion`: acá tenemos dos corchetes para llenar, en el primer corchete llenamos el _tipo de identificación_ bajo las siguiente convenciones:
   - `ti`: refiere al tipo de documento, Tarjeta de Identidad.
   - `ce`: refiere al tipo de documento, Cédula de Extranjería.
   - vacío o por defecto: refiere al tipo de documento, Cédula de Ciudadanía.
     Luego, en el segundo corchete debes colocar el número de identificación.
3. `\correo`: acá debes llenar el correo institucional del director o codirector.
4. `\programa`: finalmente, acá debes indicar la vinculación del director o codirector, por ejemplo, si este es de la facultad debes indicar el programa al que pertenece, si es externo a la facultad debes indicar a qué facultad pertenece y si es externo a la universidad debes indicar a que institución pertenece.

#### Extras dependiendo de tú caso

Dependiendo de la modalidad que hayas elegido para desarrollar tú trabajo de grado, debes seguir o no editando este documento, para ser más específicos si elegiste _Investigación, Investigación-Creación, Innovación_ o _Producción de Artículos Académicos_ debes continuar con la edición del documento, en caso contrario hasta acá termina la edición del documento.

- Para el caso de _Investigación, Investigación-Creación, Innovación_:
  Según lo exije el _Acuerdo 012 de 2022_, si trabajas bajo esta modalidad debes entregar un presupuesto para tú investigación, este presupuesto será con base en que tengas o no financiación, es decir, si no tienes financiación no hay presupuesto alguno para entregar, en cambio si tienes financiación sí debes entregar un presupuesto adjunto dado por tu semillero o grupo de investigación. Acá es donde debes comentar o no la siguiente línea de código:

  ```TeX
  \presupuesto
  ```

  En donde, si está comentada **no vas a tener financiación y por tanto no entregas presupuesto**; y si está sin comentar será directamente el caso contrario por lo que **debes entregar el presupuesto adjunto al formato**.

- Para el caso de _Producción de Artículos Académicos_:
  Según lo exije el _Acuerdo 012 de 2022_, si trabajas bajo esta modalidad debes indicar el tipo de artículo académico que vas a realizar, entre ellos hay dos opciones con base en el sistema Publindex y debes mencionar la opción en la siguiente línea de código:

  ```TeX
  \tipo{ciencia}
  ```

  Esto bajo las siguientes convenciones:- ciencia: Artículo de investigación científica o tecnológica.

  - revision: Artículo de reflexión o de revisión.

Y hasta aquí iría la edición del archivo principal, ahora con base en la modalidad que hayas elegido debes ingresar a la carpeta llamada `/modalidad` y editar el documento con extensión `.tex` que requieras basándote en la convención dada para las modalidades al inicio de la _Guía de uso_.

### Manejo del archivo `.tex` de tú modalidad

Si estás acá es porque ya llenaste todos los datos básicos necesarios para el oficio que se encuentra adjunto a la propuesta como tal de trabajo de grado, con ello implica que ya elegiste tú modalidad y conoces el contenido que exige la misma, en dado caso en el que no conozcas que exige tú modalidad te recomiendo leas el _Acuerdo 012 de 2022_ que reglamenta los trabajos de grado a nivel pregrado (y tecnológico pero no es nuestro caso).

A continuación te explicaré cosas muy fundamentales y que funcionan como una base para hacer el llenado de la propuesta, esto se dividirá en los **entornos sencillos**, **variables especiales** y **entornos especiales**, todos estos se utilizan en mayor o menor medida en cada modalidad así que siempre es bueno comprender el uso de todos.

#### Variables especiales

Las variables especiales las puedes reconocer como un comando habitual, un ejemplo de ella es la variable `\titulo{}` que consta únicamente de un corchete, dentro de dicho corchete debes colocar el título de tú trabajo de grado. Este tipo de variables la encuentras en **todos** los archivos que correspondan a una modalidad.

#### Entorno sencillos

Los entornos sencillos son similares a los ya vistos en el llenado de datos básicos previo, sin embargo, estos comprenden únicamente de colocar texto. Su estructura es la siguiente:

```TeX
\begin{entorno_sencillo}
    % Tú texto
\end{entorno_sencillo}
```

Acá tú simplemente debes colocar texto, este puede venir formateado (negrita, itálica, etc), con ecuaciones, enumerados, items, tablas, imágenes, citas y todo lo que puedas realizar en un documento normal de $\LaTeX$. Este tipo de entornos se encuentra en **todos** los archivos que correspondan a una modalidad.

Nota: como sugerencia, si vas a colocar títulos y demás, usa en vez del comando habitual de `\section{}`, el comando `\subsection*{}` (sí, con el asterisco); esto debido a que justamente los títulos de las secciones que corresponden a la entrega de la propuesta son en esencia secciones, por tanto, puede llegar a dañar la estética del documento.

#### Entornos especiales

Estos entornos, a diferencia de los anteriores se deben llenar de una forma en específico la cual no se puede alterar ya que generaría errores en la compilación del documento, de este tipo de entornos solamente hay tres: los relacionados a los objetivos y el cronograma. Estos entornos los puedes encontrar en todas las modalidades excepto en _Proyecto de emprendimiento_.

Respecto a los entornos de los objetivos:

- Entorno `objetivo_general`: este entorno, a pesar de que admite todo tipo de texto como si fuera un _entorno sencillo_, se recomienda que su uso se explícito y único para colocar una frase la cual corresponde al objetivo general de tú trabajo de grado. Tiene la siguiente estructura:

```TeX
\begin{objetivo_general}
    Un objetivo general
\end{objetivo_general}
```

Donde dice "Un objetivo general" debes colocar tú objetivo.

- Entorno `objetivos específicos`: este entorno solamente admite texto que venga con el comando `\item` siendo necesario al menos para que la compilación sea exitosa, de lo contrario habrá un error al compilar. Este posee la siguiente estructura:

```TeX
\begin{objetivos_especificos}
    \item Un objetivo específico
    \item Dos objetivos específicos
    \item Tres objetivos específicos
\end{objetivos_especificos}
```

Al frente de cada `\item` debes colocar tú objetivo específico, se recomienda un máximo de tres (3) objetivos específicos, sin embargo, puedes colocar tantos como desees y requieras.

Finalmente, respecto al entorno `cronograma`:

Este es un entorno bastante especial ya que contiene un tipo de _variable sencilla_ en su contenido la cual se llama `\actividad{}{}{}` y posee tres corchetes de llenado distinos, aquí una descripción más a fondo:

```TeX
\begin{cronograma}
    \actividad{1}{2}{Tú actividad}
\end{cronograma}
```

- Primer corchete: en este corchete el cual en el ejemplo tiene el número `1`, es para que coloques la **semana de inicio** de tú actividad.
- Primer corchete: en este corchete el cual en el ejemplo tiene el número `2`, es para que coloques la **semana de finalización** de tú actividad.
- Tercer corchete: finalmente, en este corchete es para que coloques una descripción corta (o larga si lo precisas) de tú actividad.

Esto se hace con base en un _diagrama de Gantt_, estos diagramas son especialmente útiles para mostrar y configurar cronogramas y aumentar tú productividad en el desarrollo de tus actividades permitiendo tener un espacio de trabajo organizado. El número máximo de semanas es treinta y dos (32) lo cual corresponde directamente a las semanas que se deben cursar en dos semestre académicos regulares y por tanto, a las semanas cursadas en _Trabajo de Grado 1_ y _Trabajo de Grado 2_.

Es de crucial importancia que este entorno se llene tal cual se mencionó, en caso contrario puede presentar errores muy complicados de solucionar a primera vista, si por algún motivo no lo llenas de esa forma puedes comunicarte conmigo para darte una solución pronta.

## ¡Usa la plantilla y aprende!

No siendo más, como mencioné al principio esta plantilla se maneja también con fines educativos por lo que puedes ingresar al archivo `plantilla-tg.cls` y revisar como funciona esta plantilla e incluso, dar soluciones más optimizadas para seguir mejorando esta plantilla entre todos.

Te agradezco enormemente por pasarte por acá y revisar un poco de mí trabajo que dispongo con mucho gusto y cariño a la comunidad universitaria. ¡Hasta pronto! 🤓
