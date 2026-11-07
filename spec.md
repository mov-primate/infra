# Feature Specification: MovPrimate Gym Booking Platform

**Feature Branch**: `001-gym-booking-platform`

**Created**: 2026-11-03

**Status**: Draft

**Input**: User description: "Plataforma web para un gimnasio donde los alumnos agendan sesiones de 1 hora, un administrador valida cada agendamiento y el sitio también debe mostrar la propuesta del gimnasio para atraer clientes."

## User Scenarios & Testing

### User Story 1 - Prospective client views the gym landing page (Priority: P1)

A potential customer opens the site and can understand the gym concept, services, training style, and how it works.

**Why this priority**: This creates the first conversion path and supports the business objective of attracting new members.

**Independent Test**: A user can access the landing page and see the gym presentation, services, and contact path without authentication.

**Acceptance Scenarios**:
1. Given the user is on the landing page, When they scroll the main sections, Then they can see the value proposition, services, schedule, and CTA.
2. Given the user wants to contact the gym, When they click the CTA, Then they are redirected to the appropriate contact or booking flow.

---

### User Story 2 - Student books a 1-hour session (Priority: P1)

An enrolled student chooses an available time slot and books a 1-hour session from the web application.

**Why this priority**: Booking is the core system capability and the central business process.

**Independent Test**: A valid student can choose a free slot and complete a booking without using external messaging tools.

**Acceptance Scenarios**:
1. Given the student is authenticated and sees the available slots, When they choose a 1-hour time slot, Then the system creates a booking in pending status.
2. Given the selected slot is already occupied, When the student attempts to book it, Then the system blocks the action and shows the slot as unavailable.

---

### User Story 3 - Administrator validates the booking (Priority: P1)

A gym owner or trainer reviews the pending sessions and approves or rejects them.

**Why this priority**: Admin oversight is required to maintain order and avoid conflicts.

**Independent Test**: An admin can see all pending bookings, review details, and approve or reject them.

**Acceptance Scenarios**:
1. Given there is a pending booking, When the admin approves it, Then the booking status changes to confirmed.
2. Given there is a pending booking, When the admin rejects it, Then the booking status changes to rejected and the user is informed.

---

### User Story 4 - Student checks booking status and history (Priority: P2)

A student can see the booking status and history from their panel.

**Why this priority**: Visibility of booking state reduces uncertainty and avoids external follow-up.

**Acceptance Scenarios**:
1. Given the student has a booking, When they open their account, Then they can see its status.
2. Given a booking is approved or rejected, When the student opens the details, Then they can understand the result.

---

### User Story 5 - Notification flow informs the parties (Priority: P2)

The system sends notifications after booking or status changes.

**Why this priority**: The gym requires a structured communication channel without WhatsApp.

**Acceptance Scenarios**:
1. Given a booking is created, When the system processes it, Then the student receives a confirmation or pending notice.
2. Given the booking status changes, When the admin or student is affected, Then the relevant party receives a notification.

### Edge Cases

- What happens when a student tries to book a slot while another booking exists in the same time range?
- How does the system handle an appointment cancellation?
- What happens if the admin rejects a booking after it was already considered by the student?
- How does the platform behave if an unavailable slot is attempted repeatedly?

## Requirements

### Functional Requirements

- **FR-001**: The system MUST present a public landing page for the gym with services, class philosophy, and contact/booking CTA.
- **FR-002**: The system MUST allow students to view available time slots.
- **FR-003**: The system MUST allow students to book a session with a duration of 1 hour.
- **FR-004**: The system MUST prevent booking overlapping or duplicated times.
- **FR-005**: The system MUST maintain booking status values such as pending, confirmed, rejected, and cancelled.
- **FR-006**: The system MUST allow admin users to review pending bookings.
- **FR-007**: The system MUST allow admin users to approve or reject bookings.
- **FR-008**: The system MUST inform students of the booking result through the platform.
- **FR-009**: The system MUST provide a booking history for students.
- **FR-010**: The system MUST secure admin-only actions with explicit authorization.
- **FR-011**: The system MUST support business rules that prevent invalid schedule conflicts.
- **FR-012**: The system MUST support a consistent contract between frontend, BFF, and microservices.
- **FR-013**: The system MUST make the platform usable without relying on external chat tools for coordination.

### Key Entities

- **Student**: gym member with profile, contact info, and booking activity.
- **Admin**: staff member or owner with permission to validate bookings.
- **Booking**: one-hour session request including date, time, student, status, and related metadata.
- **Time Slot**: a specific hour available or blocked in the schedule.
- **Notification**: message sent to the student or admin about a booking state change.
- **Gym Service**: public information presented on the landing page.

## Success Criteria

### Measurable Outcomes

- **SC-001**: Students can complete a valid booking in under 3 minutes.
- **SC-002**: No overlapping booking is accepted for the same time slot.
- **SC-003**: Admins can review and validate pending bookings without leaving the platform.
- **SC-004**: At least 90% of booking workflows complete without manual intervention from external communication channels.
- **SC-005**: The public landing page clearly communicates the gym value proposition to first-time visitors.

## Assumptions

- Users have a stable internet connection.
- The first release targets a single gym location or one scheduling calendar.
- Authentication and authorization are required for protected booking actions.
- Email or in-app notifications are sufficient for the first version.
- A MongoDB-based domain model is acceptable for the initial implementation.