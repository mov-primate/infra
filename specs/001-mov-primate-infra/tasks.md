# Tasks: Infraestructura local y despliegue de MovPrimate

**Input**: Design documents from `/specs/001-mov-primate-infra/`

**Prerequisites**: plan.md, spec.md, research.md, data-model.md, contracts/

## Phase 1: Setup

- [x] T001 Define overall project topology and required services
- [x] T002 Create Docker Compose structure for app, BFF, API and microservices
- [x] T003 [P] Configure MongoDB service and persistent volumes
- [x] T004 [P] Configure Mongo Express and local admin access

## Phase 2: Foundational

- [x] T005 Define shared environment variables and `.env.example`
- [x] T006 Configure network, health checks, and dependency ordering
- [x] T007 Add startup scripts for local boot and troubleshooting
- [x] T008 Validate local service connections and readiness

## Phase 3: Domain integration

- [x] T009 [P] Wire app and BFF into compose environment
- [x] T010 [P] Wire API and microservices into compose environment
- [x] T011 Configure MongoDB access for profile, agenda, notifications and audit data
- [x] T012 Validate environment variables and service-to-service communication

## Phase 4: Production readiness

- [x] T013 Define AWS deployment mapping and service segmentation
- [x] T014 Prepare environment parity for dev and target deployment
- [x] T015 Ensure no secrets are embedded in source or compose files
- [x] T016 Document troubleshooting, startup, and operational commands

## Phase 5: Final validation

- [x] T017 [P] Run a full local compose startup smoke test
- [x] T018 Validate service health and end-to-end availability
- [x] T019 Validate documentation and env config reproducibility
- [x] T020 Final AWS readiness review

## Tareas globales obligatorias (complementarias)

- [x] T021 Añadir variables/env para 4 roles y políticas de autorización.
- [x] T022 Añadir variables/env para cancelación máxima (1 hora) y cupo por clase (4).
- [x] T023 Añadir configuración para servicio de correo y reenvío de confirmaciones.
- [x] T024 Añadir trazabilidad para eventos de asistencia y agregados superadmin.
