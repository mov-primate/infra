# Requirements Quality Checklist: Infraestructura local y despliegue de MovPrimate

**Purpose**: Revisar que la infraestructura local sea reproducible, segura y apropiada para AWS.
**Created**: 2026-11-04
**Feature**: [spec.md](./spec.md)

## Local environment

- [ ] CHK001 El entorno local se levanta con Docker Compose sin pasos críticos manuales.
- [ ] CHK002 MongoDB y Mongo Express quedan disponibles para almacenamiento y diagnóstico.
- [ ] CHK003 Todos los servicios principales quedan conectados por red y variables de entorno declaradas.
- [ ] CHK004 El estado del entorno puede validarse mediante health checks y smoke tests.

## Seguridad y configuración

- [ ] CHK005 No hay secretos o credenciales hardcodeadas dentro del código fuente.
- [ ] CHK006 Las variables de entorno quedan separadas por entorno y son reproducibles.
- [ ] CHK007 La infraestructura soporta la separación por repositorio y por dominio del sistema.

## Despliegue objetivo

- [ ] CHK008 La estructura local prepara la transición a AWS sin reescritura total.
- [ ] CHK009 El diseño deja claro qué servicios y dependencias se despliegan en la nube.
- [ ] CHK010 La solución mantiene compatibilidad con la operación del flujo de reservas, validación y notificaciones.

## Reglas globales a verificar

- [ ] CHK011 Existe soporte de configuración para roles superadmin/admin/alumno/usuario.
- [ ] CHK012 La infraestructura soporta políticas de agenda: cupo 4 y cancelación hasta 1 hora antes.
- [ ] CHK013 La infraestructura soporta registro de asistencia y agregados para panel superadmin.
- [ ] CHK014 Hay configuración para envío/reenvío de correo por estados de reserva.
