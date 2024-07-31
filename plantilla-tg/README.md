# Plantilla: Trabajo de grado UD

A continuación, podrás conocer su instalación y uso:

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
  Esto bajo las siguientes convenciones:
  - ciencia: Artículo de investigación científica o tecnológica.
  - revision: Artículo de reflexión o de revisión.

Y hasta aquí iría la edición del documento principal, ahora con base en la modalidad que hayas elegido debes ingresar a la carpeta llamada `/modalidad` y editar el documento con extensión `.tex` que requieras basándote en la convención dada para las modalidades al inicio de la _Guía de uso_.
