# Feature Specification: Infraestructura local y despliegue de MovPrimate

**Feature Branch**: `001-mov-primate-infra`

**Created**: 2026-11-04

**Status**: Draft

**Input**: User description: "Define la infraestructura local de MovPrimate con MongoDB, Mongo Express, Docker Compose y variables de entorno reproducibles para AWS."

## User Scenarios & Testing

### User Story 1 - Equipo levanta el entorno local completo (Priority: P1)
Un desarrollador levanta el entorno local con Docker Compose y reproduce la plataforma sin depender de infraestructura manual.

**Why this priority**: La reproductibilidad local es la base para construir, probar y validar el sistema antes del despliegue.

**Independent Test**: El equipo puede levantar Angular, NestJS, MongoDB y servicios auxiliares con un solo comando de entorno reproducible.

**Acceptance Scenarios**:
1. **Given** que el proyecto tiene la configuración de Docker Compose, **When** se ejecuta localmente, **Then** los servicios relevantes quedan levantados y conectados.
2. **Given** que un servicio falla, **When** se revisa la composición, **Then** el diagnóstico es claro y la infraestructura permite aislar la causa.

---

### User Story 2 - Base de datos y observabilidad funcionan en local (Priority: P1)
MongoDB y Mongo Express quedan operativos para almacenamiento y diagnóstico del sistema.

**Why this priority**: La base de datos es un punto crítico del flujo de reservas y autentificación.

**Independent Test**: La base de datos local se conecta a la aplicación y permite almacenamiento de perfiles, reservas y notificaciones.

**Acceptance Scenarios**:
1. **Given** que la aplicación necesita persistencia, **When** se conecta a MongoDB, **Then** la base de datos responde y acepta registros del dominio.
2. **Given** que se requiere revisar datos, **When** se usa Mongo Express, **Then** el equipo accede a la información sin afectar el flujo de negocio.

---

### User Story 3 - Variables de entorno y secretos son reproducibles (Priority: P1)
El sistema maneja configuraciones con archivos y variables de entorno para entornos de desarrollo y preparación.

**Why this priority**: Una infraestructura reproducible debe ser segura y clara en todos los entornos.

**Independent Test**: El desarrollador puede abrir el proyecto con un conjunto de variables de entorno que funcionan en local y facilitan su migración a AWS.

**Acceptance Scenarios**:
1. **Given** que un servicio requiere una variable de entorno, **When** se configura, **Then** la aplicación la toma correctamente.
2. **Given** que se cambia el ambiente, **When** se revisan las variables, **Then** no hay dependencias ocultas ni valores hardcodeados.

---

### User Story 4 - Entorno preparado para despliegue objetivo en AWS (Priority: P2)
La infraestructura local sirve como base para trasladar la solución a AWS con ajustes mínimos.

**Why this priority**: El proyecto necesita un camino claro del entorno local al despliegue objetivo.

**Independent Test**: La configuración se estructura de forma que el despliegue en AWS pueda hacerse con el mismo modelo de servicios y variables.

**Acceptance Scenarios**:
1. **Given** que se requiere despliegue en AWS, **When** se revisan los servicios, **Then** la arquitectura deja claridad de qué se despliega y cómo se configura.
2. **Given** que hay cambios en el entorno, **When** se comparan local y nube, **Then** la diferencia es controlada y documentada.

### Edge Cases

- ¿Qué ocurre si un contenedor falla al iniciar?
- ¿Cómo se maneja una variable de entorno faltante?
- ¿Qué pasa si MongoDB no queda disponible al iniciar el entorno?
- ¿Cómo se valida la persistencia y el volumen de datos en local?

## Requirements

### Functional Requirements

- **FR-001**: La infraestructura DEBE permitir levantar el entorno local de MovPrimate con Docker Compose.
- **FR-002**: La infraestructura DEBE incluir MongoDB y Mongo Express para almacenamiento y diagnóstico.
- **FR-003**: La infraestructura DEBE separar la configuración por entorno y mantener variables de entorno reproducibles.
- **FR-004**: La infraestructura DEBE soportar el funcionamiento de frontend, BFF, API y microservicios del dominio.
- **FR-005**: La infraestructura DEBE ser compatible con la lógica de reservas, validación administrativa y notificaciones del negocio.
- **FR-006**: La infraestructura DEBE mantener observabilidad básica y trazabilidad local del entorno.
- **FR-007**: La infraestructura DEBE preparar la ruta a despliegue en AWS sin depender de configuraciones ad hoc.
- **FR-008**: La infraestructura DEBE evitar secretos hardcodeados dentro del código fuente.

### Key Entities

- **Servicio**: componente del sistema que corre dentro del entorno Docker.
- **Contenedor**: proceso aislado para una dependencia o microservicio del proyecto.
- **MongoDB**: base de datos principal del almacenamiento del dominio.
- **Mongo Express**: herramienta de administración local para diagnóstico y mantenimiento.
- **Variable de entorno**: configuración dinámica por servicio y ambiente.
- **Entorno**: conjunto de configuración para desarrollo local y despliegue objetivo.

## Success Criteria

### Measurable Outcomes

- **SC-001**: El entorno local se levanta en una sola composición reproducible sin pasos manuales críticos.
- **SC-002**: Los servicios principales de la plataforma quedan conectados y operando en local.
- **SC-003**: MongoDB mantiene persistencia y acceso para reservas, perfiles y eventos del negocio.
- **SC-004**: La infraestructura mantiene configuración segura y separada por entorno.
- **SC-005**: La solución presenta un camino claro para despliegue objetivo en AWS con cambios mínimos de estructura.

## Assumptions

- El entorno local se ejecuta con Docker Compose y accesos declarados en el repositorio.
- MongoDB se usa como base de datos principal del sistema para la versión inicial.
- Los servicios que dependen entre sí se conectan mediante redes y variables de entorno definidas.
- La configuración de producción no debe incluir secretos o valores de desarrollo embebidos.
- El despliegue en AWS será una evolución de la infraestructura local, no una reescritura completa.

## Reglas globales obligatorias (actualización Infra)

- La infraestructura debe soportar 4 roles de usuario (`superadmin`, `admin`, `alumno`, `usuario`) vía configuración consistente de servicios auth/BFF/API.
- Debe habilitar servicios y variables para:
  - cambio de rol y desactivación de usuario por superadmin,
  - reservas con cupo máximo 4 y selección de profesor,
  - cancelación hasta 1 hora antes,
  - registro de asistencia por admin,
  - panel de superadmin con totales de asistencia.
- Debe incluir capacidad operativa para envío/reenvío de correos de confirmación por estado de reserva.
