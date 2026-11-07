# Data Model: Infraestructura MovPrimate

- ServiceConfig: name, image, ports, envFile, dependsOn
- EnvVar: key, required, defaultScope
- VolumeBinding: service, volumeName, mountPath
- PolicyConfig: key, value (capacity_max, cancellation_window_minutes)

Reglas:
- no secretos hardcodeados.
- dependencias declaradas explícitamente.
- políticas globales disponibles por configuración central.
