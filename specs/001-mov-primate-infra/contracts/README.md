# Contracts: Infraestructura MovPrimate

Componentes mínimos:
- app
- bff
- api
- ms-agenda
- ms-alumnos
- ms-notificaciones
- mongodb
- mongo-express

Contrato operativo:
- variables de entorno declaradas
- healthchecks por servicio
- red compartida de compose
- políticas globales declaradas: CAPACITY_MAX=4, CANCELLATION_WINDOW_MINUTES=60
- configuración de correo declarada: SMTP_HOST, SMTP_PORT, SMTP_USER, SMTP_PASS, MAIL_FROM
