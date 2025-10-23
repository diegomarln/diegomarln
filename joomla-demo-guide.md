# Guía Completa: Demostración de Joomla

## Objetivo
Crear una página de demostración de Joomla que incluya:
- Un carrusel nativo con al menos 10 imágenes de test
- Un sistema de login
- Una subpágina de noticias con artículos

## Paso 1: Instalación y Configuración Inicial de Joomla

### 1.1 Requisitos del Sistema
- PHP 8.0 o superior
- MySQL 5.7 o superior / MariaDB 10.3 o superior
- Apache 2.4+ o Nginx
- Extensiones PHP: mysqli, gd, curl, json, mbstring, zip, xml

### 1.2 Descarga e Instalación
1. Descargar Joomla 5.x desde https://downloads.joomla.org/
2. Extraer archivos en el directorio web
3. Configurar permisos de directorio (755 para carpetas, 644 para archivos)
4. Acceder a la URL de instalación: `http://tudominio.com/installation/`

### 1.3 Configuración de Base de Datos
1. Crear base de datos MySQL
2. Crear usuario con permisos completos
3. Durante la instalación, proporcionar:
   - Nombre de la base de datos
   - Usuario de base de datos
   - Contraseña
   - Prefijo de tabla (ej: `jos_`)

## Paso 2: Configuración del Carrusel Nativo

### 2.1 Instalación del Módulo de Carrusel
Joomla 5 incluye un módulo de carrusel nativo. Para activarlo:

1. **Ir al Panel de Administración**
   - Acceder a: `http://tudominio.com/administrator/`
   - Login con credenciales de administrador

2. **Crear Módulo de Carrusel**
   - Ir a: `Contenido > Módulos de sitio`
   - Clic en "Nuevo"
   - Seleccionar tipo: "Carrusel de imágenes"

### 2.2 Configuración del Carrusel
```php
// Configuración básica del módulo
Título: "Carrusel de Demostración"
Posición: "banner" o "top"
Estado: Publicado
Acceso: Público
```

### 2.3 Preparación de Imágenes de Test
Crear 10 imágenes de test (recomendado: 1920x600px):

1. **Subir imágenes al directorio:**
   ```
   /images/carrusel/
   ```

2. **Nombres sugeridos:**
   - `demo-01.jpg`
   - `demo-02.jpg`
   - `demo-03.jpg`
   - ... hasta `demo-10.jpg`

### 2.4 Configuración de Parámetros del Carrusel
```php
// En los parámetros del módulo:
Imágenes: Seleccionar las 10 imágenes
Altura: 400px
Ancho: 100%
Autoplay: Sí
Intervalo: 5000ms
Efecto: Deslizamiento
Mostrar indicadores: Sí
Mostrar controles: Sí
```

## Paso 3: Implementación del Sistema de Login

### 3.1 Configuración de Usuarios
1. **Crear usuarios de prueba:**
   - Ir a: `Usuarios > Gestión de usuarios`
   - Crear usuarios con diferentes niveles:
     - Administrador
     - Editor
     - Usuario registrado

### 3.2 Configuración del Módulo de Login
1. **Crear módulo de login:**
   - Ir a: `Contenido > Módulos de sitio`
   - Clic en "Nuevo"
   - Seleccionar: "Formulario de inicio de sesión"

2. **Configuración del módulo:**
```php
Título: "Iniciar Sesión"
Posición: "sidebar-left" o "login"
Estado: Publicado
Acceso: Invitado
```

### 3.3 Personalización del Login
```php
// Parámetros del módulo:
Mostrar título: Sí
Mostrar enlace de registro: Sí
Mostrar enlace de recuperación: Sí
Redirección después del login: Página de inicio
```

## Paso 4: Creación de la Subpágina de Noticias

### 4.1 Configuración de Categorías
1. **Crear categoría de noticias:**
   - Ir a: `Contenido > Categorías`
   - Clic en "Nuevo"
   - Nombre: "Noticias"
   - Alias: "noticias"
   - Descripción: "Categoría para artículos de noticias"

### 4.2 Creación de Artículos de Noticias
1. **Crear artículos de ejemplo:**
   - Ir a: `Contenido > Artículos`
   - Clic en "Nuevo"

2. **Artículos sugeridos:**
   - "Nueva actualización de Joomla 5.0"
   - "Mejoras en el rendimiento del sitio"
   - "Nuevas características de seguridad"
   - "Tutorial: Personalización de plantillas"
   - "Comunidad Joomla: Eventos próximos"

### 4.3 Configuración de Artículos
```php
// Para cada artículo:
Título: [Título de la noticia]
Categoría: Noticias
Estado: Publicado
Acceso: Público
Fecha de creación: [Fecha actual]
Autor: [Usuario administrador]
```

### 4.4 Creación de Menú de Noticias
1. **Crear elemento de menú:**
   - Ir a: `Menús > [Menú principal]`
   - Clic en "Nuevo"
   - Tipo de elemento: "Lista de artículos de una categoría"
   - Título: "Noticias"
   - Alias: "noticias"

2. **Configuración del menú:**
```php
Categoría: Noticias
Orden: Más recientes primero
Número de artículos: 10
Mostrar título: Sí
Mostrar autor: Sí
Mostrar fecha: Sí
Mostrar categoría: Sí
```

## Paso 5: Configuración de la Plantilla

### 5.1 Selección de Plantilla
1. **Usar plantilla predeterminada:**
   - Ir a: `Sistema > Plantillas de sitio`
   - Activar "Cassiopee" (plantilla predeterminada de Joomla 5)

### 5.2 Personalización de Posiciones
```php
// Configurar posiciones para los módulos:
banner: Carrusel de imágenes
main: Contenido principal
sidebar-left: Módulo de login
sidebar-right: Módulos adicionales
footer: Información del sitio
```

## Paso 6: Configuración de Módulos Adicionales

### 6.1 Módulo de Artículos Recientes
1. **Crear módulo:**
   - Ir a: `Contenido > Módulos de sitio`
   - Clic en "Nuevo"
   - Seleccionar: "Artículos - Más recientes"

2. **Configuración:**
```php
Título: "Últimas Noticias"
Posición: "sidebar-right"
Categoría: Noticias
Número de artículos: 5
Mostrar fecha: Sí
Mostrar autor: Sí
```

### 6.2 Módulo de Navegación
1. **Configurar menú principal:**
   - Ir a: `Contenido > Módulos de sitio`
   - Clic en "Nuevo"
   - Seleccionar: "Menú"

2. **Configuración:**
```php
Título: "Menú Principal"
Posición: "top"
Menú: [Menú principal]
Mostrar submenús: Sí
```

## Paso 7: Optimización y Pruebas

### 7.1 Configuración de SEO
1. **Configurar URLs amigables:**
   - Ir a: `Sistema > Configuración global`
   - Pestaña "Sitio"
   - Activar "URLs amigables"

2. **Configurar metadatos:**
   - Para cada artículo, configurar:
     - Meta descripción
     - Palabras clave
     - Título SEO

### 7.2 Pruebas de Funcionalidad
1. **Probar carrusel:**
   - Verificar que las imágenes se muestran correctamente
   - Comprobar navegación automática y manual
   - Verificar responsividad

2. **Probar login:**
   - Intentar login con credenciales incorrectas
   - Login exitoso con usuarios válidos
   - Verificar redirección después del login

3. **Probar noticias:**
   - Verificar que los artículos se muestran en la página de noticias
   - Comprobar enlaces a artículos individuales
   - Verificar módulo de artículos recientes

## Paso 8: Personalización Avanzada

### 8.1 CSS Personalizado
```css
/* Agregar en: Sistema > Plantillas de sitio > [Plantilla] > Archivos */
.carrusel-demo {
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.noticias-container {
    padding: 20px;
    background: #f8f9fa;
    border-radius: 5px;
}
```

### 8.2 Configuración de Caché
1. **Activar caché:**
   - Ir a: `Sistema > Configuración global`
   - Pestaña "Sistema"
   - Activar "Caché"

## Estructura Final del Sitio

```
Página Principal:
├── Carrusel de imágenes (10 imágenes)
├── Módulo de login (sidebar)
├── Menú de navegación
└── Módulo de artículos recientes

Página de Noticias:
├── Lista de artículos de la categoría "Noticias"
├── Paginación
├── Información de autor y fecha
└── Enlaces a artículos completos
```

## Comandos Útiles para Desarrollo

### Limpiar caché desde línea de comandos:
```bash
php cli/joomla.php cache:clean
```

### Verificar configuración:
```bash
php cli/joomla.php system:check
```

### Instalar extensiones:
```bash
php cli/joomla.php extension:install [ruta-del-paquete]
```

## Notas Importantes

1. **Seguridad:**
   - Cambiar contraseñas por defecto
   - Mantener Joomla actualizado
   - Usar HTTPS en producción

2. **Rendimiento:**
   - Optimizar imágenes del carrusel
   - Activar compresión GZIP
   - Configurar caché apropiadamente

3. **Mantenimiento:**
   - Hacer respaldos regulares
   - Monitorear logs de error
   - Actualizar extensiones regularmente

Esta guía te permitirá crear una demostración completa de Joomla con todas las características solicitadas.