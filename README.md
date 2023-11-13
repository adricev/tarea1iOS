# Supabase Table Data Modification

Este script de Python utiliza la biblioteca Supabase para realizar operaciones de consulta y modificación en una base de datos Supabase. Permite al usuario listar campos de una tabla, seleccionar un campo por el cual restringir la modificación, y luego actualizar valores en esa tabla.

## Requisitos

- Python 3.x
- [Supabase Python Client](https://github.com/supabase/supabase-py)

## Configuración

Antes de ejecutar el script, asegúrate de tener instalada la biblioteca Supabase Python Client. Puedes instalarla ejecutando:

```bash
pip install supabase-py
```

Asegúrate de tener la URL y la clave de la API de Supabase listas para usar.

## Uso

1. Ejecuta el script.
2. Ingresa el nombre de la tabla que deseas modificar (`tag`, `calendars`, `comments`, `events`, `users`).
3. Se mostrará una lista de campos disponibles en la tabla seleccionada.
4. Proporciona el nombre del campo "Id" para restringir la modificación.
5. Proporciona el valor de la Id.
6. Proporciona el nombre del campo que deseas modificar.
7. Ingresa el nuevo valor para ese campo.

El script validará las entradas del usuario para evitar operaciones incorrectas.

## Notas

- Asegúrate de tener los permisos adecuados para realizar operaciones de modificación en la base de datos, aunque no debería de haber problemas con ellos

---

**Nota:** Asegúrate de manejar las credenciales con precaución y no las compartas públicamente.

Este README proporciona una breve descripción del script y cómo utilizarlo. Puedes agregar más secciones según tus necesidades.
