// MovPrimate — Inicialización de bases de datos MongoDB
// Este script se ejecuta automáticamente al primer arranque del contenedor mongo

const rootUser = process.env.MONGO_INITDB_ROOT_USERNAME || 'root';
const rootPass = process.env.MONGO_INITDB_ROOT_PASSWORD || 'changeme';

const databases = [
  'movprimate_alumnos',
  'movprimate_agenda',
  'movprimate_api',
  'movprimate_notificaciones',
];

// Crear cada base de datos con una colección de inicialización
databases.forEach(dbName => {
  const db = db.getSiblingDB(dbName);
  db.createCollection('_init');
  db._init.insertOne({ initialized: true, createdAt: new Date() });
  print(`[init] Base de datos '${dbName}' inicializada.`);
});

print('[init] Inicialización de MovPrimate completada.');
