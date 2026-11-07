# Tasks: Infraestructura local y despliegue de MovPrimate

**Input**: Design documents from `/specs/001-mov-primate-infra/`

**Prerequisites**: plan.md, spec.md, research.md, data-model.md, contracts/

## Phase 1: Setup

- [ ] T001 Define overall project topology and required services
- [ ] T002 Create Docker Compose structure for app, BFF, API and microservices
- [ ] T003 [P] Configure MongoDB service and persistent volumes
- [ ] T004 [P] Configure Mongo Express and local admin access

## Phase 2: Foundational

- [ ] T005 Define shared environment variables and `.env.example`
- [ ] T006 Configure network, health checks, and dependency ordering
- [ ] T007 Add startup scripts for local boot and troubleshooting
- [ ] T008 Validate local service connections and readiness

## Phase 3: Domain integration

- [ ] T009 [P] Wire app and BFF into compose environment
- [ ] T010 [P] Wire API and microservices into compose environment
- [ ] T011 Configure MongoDB access for profile, agenda, notifications and audit data
- [ ] T012 Validate environment variables and service-to-service communication

## Phase 4: Production readiness

- [ ] T013 Define AWS deployment mapping and service segmentation
- [ ] T014 Prepare environment parity for dev and target deployment
- [ ] T015 Ensure no secrets are embedded in source or compose files
- [ ] T016 Document troubleshooting, startup, and operational commands

## Phase 5: Final validation

- [ ] T017 [P] Run a full local compose startup smoke test
- [ ] T018 Validate service health and end-to-end availability
- [ ] T019 Validate documentation and env config reproducibility
- [ ] T020 Final AWS readiness review

## Tareas globales obligatorias (complementarias)

- [ ] T021 Añadir variables/env para 4 roles y políticas de autorización.
- [ ] T022 Añadir variables/env para cancelación máxima (1 hora) y cupo por clase (4).
- [ ] T023 Añadir configuración para servicio de correo y reenvío de confirmaciones.
- [ ] T024 Añadir trazabilidad para eventos de asistencia y agregados superadmin.
