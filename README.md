# Actividad 025 - Formularios y validaciones.

- Para poder realizar este actividad debes haber realizado los cursos previos junto con los videos online correspondientes a la experiencia 13.

- Al finalizar la actividad debes hacer push a un repositorio en tu cuenta de GitHub y subir el link a la plataforma empieza.

## Ejercicio 1: Registro de ventas.

#### El objetivo de esta actividad es generar una aplicación que permita ingresar registros de venta, validar los campos de ingreso, procesar la información y generar la salida esperada.

- Crear un nuevo proyecto en Rails 5.1

- Crear un modelo llamado **Sale** con los campos:

    - cod (integer) => código de la venta
    - detail (string) => detalle de la venta
    - category (string) => categoría de la venta (ingreso manual)
    - value (integer) => valor de la venta
    - discount (integer) => porcentaje de descuento aplicado de (1-100).
    - tax (integer) => porcentaje correspondiente al IVA.
    - total (float) => total de la venta después de aplicado descuento e impuesto.

- Revisar y correr la migración generada.

- Crear un controller **sales** con el método *new*.

- Crear la ruta y el método para la creación de un nuevo registro de venta (**sales#create**). *Hint: recordar que la url a la que apuntará el formulario debe obedecer a la arquitectura rest.*

- En la vista *new* se debe generar un formulario de ingreso de venta. 

- El formulario debe ser generado utilizando el helper *form_with* asociado al modelo *Sale* y debe contener:

	 - Un *input* tipo númerico para el código.
    - Un *textarea* para el detalle de la venta.
    - Un *input* tipo texto para la categoría.
    - Un *input* tipo númerico para el valor.
    - Un *input* tipo numérico para el descuento.
    - Un *checkbox* para la opción "Exento de IVA".
    - **Cada input debe ir acompañado de un label**.

- En el modelo *Sale* se debe validar que:

    - El campo *cod* debe ser único (**uniqueness**)
    - El detalle debe estar presente (**presence**)
    - La categoría debe estar contenida dentro de la siguiente colección: (**inclusion**)

         ~~~rb
            %w(uno dos tres cuatro cinco)       
         ~~~

    - El campo *value* debe ser entero y positivo (**numericality**).
    - El campo *discount* debe ser entero, positivo y menor o igual a 40.

- El método *sales#create* debe recibir los parámetros desde el formulario y realizar las siguientes instrucciones:

    - Aplicar el descuento al valor.

    - Aplicar impuesto al valor resultante para obtener el total:

        - Si el checkbox **NO** no fue seleccionado, se debe aplicar un impuesto de 19% al valor obtenido después de aplicar el descuento y el registro debe ser almacenado con un **tax = 19**.

        - Si el checkbox **SI** no fue seleccionado. Se debe omitir este paso y el registro se almacenará con un **tax = 0**.

    - Almacenar un nuevo registro de venta.

- Crear la ruta, el método y la vista para la página de redirección (**sales#done**).

- El método *sales#create* debe redirigir a sales/done. *Hint: utiliza el prefijo que arroja **rake routes***.

- La vista *done.html.erb* debe mostrar un mensaje "El registro fue almacenado con éxito!" y luego listar en una tabla todos los campos del registro ingresado. Finalmente añadir un link 'Volver' que apunte a la vista del formulario.