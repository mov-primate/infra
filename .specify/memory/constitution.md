# Constitución de infraestructura MovPrimate

## Principios fundamentales

### I. Reproducibilidad local
La infraestructura debe permitir levantar el entorno de desarrollo con una sola decisión técnica clara: contenedores definidos y reproducibles mediante Docker Compose. Debe soportar el flujo de landing page, BFF, API, microservicios y MongoDB.

### II. Seguridad de configuración
Credenciales, variables de entorno y secretos deben gestionarse fuera del código fuente y mantenerse mínimos, explícitos y aislados por ambiente. Debe separar configuración de servicios de negocio y permisos de acceso.

### III. Compatibilidad por entorno
La infraestructura debe ofrecer un comportamiento consistente entre desarrollo local y preparación para despliegue en AWS, sin depender de supuestos invisibles del entorno.

### IV. Observabilidad del entorno
Los servicios deben estar monitoreables, con logs accesibles y salud verificable para detectar fallos y facilitar recuperación. Debe permitir validar la operación de alumnos, administradores y notificaciones.

### V. Aislamiento de responsabilidades
La infraestructura debe manejar componentes transversales como bases de datos, redes y almacenamiento, pero no debe mezclar reglas de negocio ni decisiones de dominio de la aplicación.

## Restricciones del producto

- Base de datos local: MongoDB
- Admin local: Mongo Express
- Red local: bridge definida por Docker Compose
- Persistencia: volumen Docker para datos de MongoDB
- Entorno de desarrollo: Visual Studio Code + Docker + GitHub Copilot
- Objetivo de despliegue: AWS
- Debe soportar términos de autenticación, reservas, validación y notificaciones por plataforma

## Flujo de trabajo de desarrollo

- Todo cambio de infraestructura debe validarse con composición y reinicio controlado.
- Las rutas y variables de entorno deben mantenerse consistentes con la estructura real del proyecto.
- La configuración debe documentarse y revisarse antes de compartir con otros repositorios o entornos.
- La infraestructura debe mantener soporte para el flujo de Spec Kit del proyecto.
- Los cambios que afecten puertos, redes, credenciales o dependencias de servicios deben revisarse con especial cuidado.

## Gobernanza

La infraestructura de MovPrimate debe mantenerse simple, segura y reproducible. Cualquier cambio que altere conexiones, puertos, credenciales, dependencias de entorno o capacidad de los servicios debe revisarse antes de integrarse al proyecto.

**Versión**: 1.0.1 | **Ratificada**: 2026-11-04 | **Última modificación**: 2026-11-04
