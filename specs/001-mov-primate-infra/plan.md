# Implementation Plan: Infraestructura local y despliegue de MovPrimate

**Branch**: `001-mov-primate-infra` | **Date**: 2026-11-04 | **Spec**: [spec.md](./spec.md)

**Input**: Feature specification from `/specs/001-mov-primate-infra/spec.md`

## Summary

La infraestructura de MovPrimate debe permitir levantar el entorno local con Docker Compose, conectar frontend, BFF, API y microservicios, y dejar la base para despliegue en AWS. Debe incluir MongoDB, Mongo Express y variables de entorno reproducibles sin hardcodear secretos. La estructura debe soportar el flujo principal de landing page, autenticación, reservas y validación, con la separación de responsabilidades por repositorio y rol.

## Technical Context

**Language/Version**: Docker Compose, environment configuration, shell scripts

**Primary Dependencies**: Docker Compose, MongoDB, Mongo Express, application service containers, AWS deployment mapping

**Storage**: Local Docker volumes for MongoDB and service data persistence

**Testing**: Compose validation, service health check validation, environment start-up smoke tests

**Target Platform**: Local development environment and AWS target deployment

**Project Type**: Infrastructure / devops configuration

**Performance Goals**: Fast local start, predictable service startup order, stable health checks

**Constraints**:
- Secrets must not be hardcoded
- Service composition must be reproducible
- All domain services must connect through declared env config
- Local environment must align to production architecture conventions

**Scale/Scope**:
- App, BFF, API and microservices
- MongoDB and Mongo Express
- Environment variables and startup scripts
- AWS migration path and observability baseline

## Constitution Check

*GATE: Must pass before implementation.*

- Local reproducibility is supported: PASS
- Environmental configuration is explicit and separated: PASS
- Services and dependencies are declared in compose: PASS
- Security constraint against hardcoded secrets: PASS
- AWS target is considered in design: PASS

## Project Structure

### Documentation (this feature)

```text
specs/001-mov-primate-infra/
├── plan.md
├── research.md
├── data-model.md
├── quickstart.md
├── contracts/
└── tasks.md
```

### Source Code (repository root)

```text
docker-compose.yml
.env.example
mongo-init/
services/
├── app/
├── bff/
├── api/
├── agenda/
├── alumnos/
├── notificaciones/
└── mongo/
```

**Structure Decision**: Infrastructure will be organized by service and environment so each component is reproducible locally and can be mapped to AWS with minimal structural changes.

## Complexity Tracking

No constitutional violations were identified, so no complexity exceptions are required.

## Addendum de alcance obligatorio

- Declarar variables de entorno para RBAC de 4 roles.
- Incluir configuración para servicio de correo y reenvío controlado.
- Incluir configuración para reglas de agenda:
  - cupo máximo 4,
  - ventana de cancelación 1 hora,
  - registro de asistencia.
- Asegurar observabilidad de eventos de reservas, asistencia y correos.
