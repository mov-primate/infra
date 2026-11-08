// MovPrimate — Índices iniciales de MongoDB

// ── alumnos ──────────────────────────────────────────────────────
const alumnos = db.getSiblingDB('movprimate_alumnos');
alumnos.users.createIndex({ email: 1 }, { unique: true, name: 'idx_users_email' });
alumnos.profiles.createIndex({ userId: 1 }, { unique: true, name: 'idx_profiles_userId' });
alumnos.auditlogs.createIndex({ userId: 1, timestamp: -1 }, { name: 'idx_auditlogs_user_ts' });
print('[indexes] movprimate_alumnos: índices creados.');

// ── agenda ───────────────────────────────────────────────────────
const agenda = db.getSiblingDB('movprimate_agenda');
agenda.slots.createIndex({ professorId: 1, startAt: 1 }, { name: 'idx_slots_prof_start' });
agenda.bookings.createIndex({ studentId: 1, slotId: 1 }, { unique: true, name: 'idx_bookings_student_slot' });
agenda.bookings.createIndex({ professorId: 1, status: 1 }, { name: 'idx_bookings_prof_status' });
print('[indexes] movprimate_agenda: índices creados.');

// ── api ───────────────────────────────────────────────────────────
const api = db.getSiblingDB('movprimate_api');
api.users.createIndex({ email: 1 }, { unique: true, name: 'idx_api_users_email' });
api.bookings.createIndex({ studentId: 1, slotStart: 1, slotEnd: 1 }, { name: 'idx_api_bookings_student_slot' });
api.rolechanges.createIndex({ userId: 1, changedAt: -1 }, { name: 'idx_rolechanges_user_ts' });
print('[indexes] movprimate_api: índices creados.');

// ── notificaciones ────────────────────────────────────────────────
const notif = db.getSiblingDB('movprimate_notificaciones');
notif.notifications.createIndex({ recipientId: 1, createdAt: -1 }, { name: 'idx_notif_recipient_ts' });
notif.eventfingerprints.createIndex({ hash: 1 }, { unique: true, name: 'idx_fingerprint_hash' });
print('[indexes] movprimate_notificaciones: índices creados.');

print('[indexes] Índices de MovPrimate completados.');
