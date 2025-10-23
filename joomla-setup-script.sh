#!/bin/bash

# Script de configuración automática para demostración de Joomla
# Este script ayuda a configurar el entorno para la demostración

echo "=== Configuración de Demostración de Joomla ==="
echo ""

# Verificar si estamos en un entorno con Joomla instalado
if [ ! -f "configuration.php" ]; then
    echo "❌ Error: No se encontró Joomla instalado en este directorio"
    echo "   Por favor, instala Joomla primero siguiendo la guía"
    exit 1
fi

echo "✅ Joomla detectado en el directorio actual"
echo ""

# Crear directorio para imágenes del carrusel
echo "📁 Creando directorio para imágenes del carrusel..."
mkdir -p images/carrusel
echo "✅ Directorio creado: images/carrusel"

# Crear directorio para imágenes de noticias
echo "📁 Creando directorio para imágenes de noticias..."
mkdir -p images/noticias
echo "✅ Directorio creado: images/noticias"

# Crear archivo de configuración de ejemplo
echo "📝 Creando archivo de configuración de ejemplo..."
cat > joomla-demo-config.php << 'EOF'
<?php
/**
 * Configuración de ejemplo para demostración de Joomla
 * Este archivo contiene configuraciones específicas para la demo
 */

// Configuración del carrusel
$carrusel_config = [
    'imagenes' => [
        'demo-01.jpg',
        'demo-02.jpg', 
        'demo-03.jpg',
        'demo-04.jpg',
        'demo-05.jpg',
        'demo-06.jpg',
        'demo-07.jpg',
        'demo-08.jpg',
        'demo-09.jpg',
        'demo-10.jpg'
    ],
    'configuracion' => [
        'autoplay' => true,
        'intervalo' => 5000,
        'altura' => '400px',
        'efecto' => 'slide',
        'indicadores' => true,
        'controles' => true
    ]
];

// Configuración de usuarios de prueba
$usuarios_demo = [
    [
        'nombre' => 'Administrador Demo',
        'usuario' => 'admin_demo',
        'email' => 'admin@demo.com',
        'password' => 'demo123',
        'grupo' => 'Super Users'
    ],
    [
        'nombre' => 'Editor Demo',
        'usuario' => 'editor_demo', 
        'email' => 'editor@demo.com',
        'password' => 'demo123',
        'grupo' => 'Editors'
    ],
    [
        'nombre' => 'Usuario Demo',
        'usuario' => 'user_demo',
        'email' => 'user@demo.com', 
        'password' => 'demo123',
        'grupo' => 'Registered'
    ]
];

// Configuración de artículos de noticias
$noticias_demo = [
    [
        'titulo' => 'Nueva actualización de Joomla 5.0 disponible',
        'alias' => 'nueva-actualizacion-joomla-5',
        'categoria' => 'Noticias',
        'contenido' => 'Joomla 5.0 trae mejoras significativas en rendimiento y seguridad...'
    ],
    [
        'titulo' => 'Mejoras en el rendimiento del sitio web',
        'alias' => 'mejoras-rendimiento-sitio',
        'categoria' => 'Noticias', 
        'contenido' => 'Las nuevas optimizaciones permiten cargas más rápidas...'
    ],
    [
        'titulo' => 'Nuevas características de seguridad implementadas',
        'alias' => 'nuevas-caracteristicas-seguridad',
        'categoria' => 'Noticias',
        'contenido' => 'El sistema de seguridad ha sido reforzado con nuevas medidas...'
    ],
    [
        'titulo' => 'Tutorial: Personalización de plantillas en Joomla',
        'alias' => 'tutorial-personalizacion-plantillas',
        'categoria' => 'Noticias',
        'contenido' => 'Aprende a personalizar las plantillas de Joomla paso a paso...'
    ],
    [
        'titulo' => 'Comunidad Joomla: Eventos y conferencias próximos',
        'alias' => 'comunidad-joomla-eventos',
        'categoria' => 'Noticias',
        'contenido' => 'Descubre los próximos eventos de la comunidad Joomla...'
    ]
];

echo "✅ Archivo de configuración creado: joomla-demo-config.php"
EOF

# Crear archivo SQL para datos de demostración
echo "📝 Creando archivo SQL con datos de demostración..."
cat > joomla-demo-data.sql << 'EOF'
-- Datos de demostración para Joomla
-- Ejecutar desde el panel de administración o phpMyAdmin

-- Insertar categoría de noticias
INSERT INTO `#__categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(2, 0, 0, 0, 1, 0, 'noticias', 'com_content', 'Noticias', 'noticias', '', 'Categoría para artículos de noticias de demostración', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{}', 0, '2024-01-01 00:00:00', 0, '2024-01-01 00:00:00', 0, '*', 1);

-- Insertar artículos de noticias de demostración
INSERT INTO `#__content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 0, 'Nueva actualización de Joomla 5.0 disponible', 'nueva-actualizacion-joomla-5', 'Joomla 5.0 trae mejoras significativas en rendimiento y seguridad que benefician tanto a desarrolladores como a usuarios finales.', '<p>Joomla 5.0 representa un hito importante en la evolución de este popular sistema de gestión de contenidos. Las nuevas características incluyen mejoras en el rendimiento, nuevas herramientas de desarrollo y un enfoque renovado en la seguridad.</p><p>Entre las mejoras más destacadas se encuentran:</p><ul><li>Mejor rendimiento general del sistema</li><li>Nuevas características de seguridad</li><li>Interfaz de usuario mejorada</li><li>Mejor compatibilidad con PHP 8.x</li></ul>', 1, 2, '2024-01-01 00:00:00', 0, '', '2024-01-01 00:00:00', 0, 0, '0000-00-00 00:00:00', '2024-01-01 00:00:00', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 0, '{}', 0, '*', ''),
(2, 0, 'Mejoras en el rendimiento del sitio web', 'mejoras-rendimiento-sitio', 'Las nuevas optimizaciones implementadas en Joomla permiten cargas más rápidas y una mejor experiencia de usuario.', '<p>El rendimiento es una de las prioridades principales en el desarrollo de Joomla. Las últimas versiones han introducido mejoras significativas que se traducen en sitios web más rápidos y eficientes.</p><p>Principales mejoras de rendimiento:</p><ul><li>Optimización de consultas de base de datos</li><li>Mejor gestión de caché</li><li>Compresión de archivos mejorada</li><li>Optimización de imágenes automática</li></ul>', 1, 2, '2024-01-02 00:00:00', 0, '', '2024-01-02 00:00:00', 0, 0, '0000-00-00 00:00:00', '2024-01-02 00:00:00', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 0, '{}', 0, '*', '');

-- Nota: Reemplazar #__ con el prefijo real de tu instalación de Joomla
EOF

echo "✅ Archivo SQL creado: joomla-demo-data.sql"

# Crear archivo de imágenes de ejemplo (placeholder)
echo "📝 Creando archivos de imágenes de ejemplo..."
for i in {1..10}; do
    printf "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==" | base64 -d > "images/carrusel/demo-$(printf "%02d" $i).jpg"
done
echo "✅ Imágenes de ejemplo creadas en images/carrusel/"

# Crear archivo README con instrucciones
echo "📝 Creando archivo README con instrucciones..."
cat > README-DEMO.md << 'EOF'
# Demostración de Joomla - Instrucciones de Uso

## Archivos Incluidos

- `joomla-demo-guide.md` - Guía completa paso a paso
- `joomla-demo-config.php` - Configuración de ejemplo
- `joomla-demo-data.sql` - Datos de demostración
- `images/carrusel/` - Imágenes para el carrusel (10 archivos)
- `images/noticias/` - Directorio para imágenes de noticias

## Pasos Rápidos

1. **Instalar Joomla 5.x** siguiendo la guía oficial
2. **Ejecutar el SQL** de datos de demostración en phpMyAdmin
3. **Subir las imágenes** del carrusel al directorio correcto
4. **Configurar los módulos** según la guía detallada
5. **Crear usuarios de prueba** con las credenciales del archivo de configuración

## Credenciales de Prueba

- **Administrador:** admin_demo / demo123
- **Editor:** editor_demo / demo123  
- **Usuario:** user_demo / demo123

## Características Implementadas

✅ Carrusel nativo con 10 imágenes
✅ Sistema de login funcional
✅ Subpágina de noticias con artículos
✅ Módulos adicionales (artículos recientes, menú)
✅ Configuración SEO básica

## Soporte

Para dudas o problemas, consultar la guía completa en `joomla-demo-guide.md`
EOF

echo "✅ Archivo README creado: README-DEMO.md"

echo ""
echo "🎉 ¡Configuración completada!"
echo ""
echo "📋 Próximos pasos:"
echo "1. Instalar Joomla 5.x en tu servidor"
echo "2. Ejecutar el archivo SQL: joomla-demo-data.sql"
echo "3. Subir las imágenes del carrusel"
echo "4. Seguir la guía detallada: joomla-demo-guide.md"
echo ""
echo "📁 Archivos creados:"
echo "   - joomla-demo-guide.md (guía completa)"
echo "   - joomla-demo-config.php (configuración)"
echo "   - joomla-demo-data.sql (datos de demo)"
echo "   - images/carrusel/ (10 imágenes de ejemplo)"
echo "   - README-DEMO.md (instrucciones rápidas)"
echo ""
echo "¡Listo para comenzar tu demostración de Joomla! 🚀"