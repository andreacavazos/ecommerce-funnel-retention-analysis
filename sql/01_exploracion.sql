-- Proyecto 4 · Sprint 4 (TripleTen)
-- Exploración inicial de las tablas de eventos y retención.
-- Transcripción de las tres consultas visibles en las capturas.

SELECT *
FROM mercadolibre_funnel
LIMIT 5;

SELECT *
FROM mercadolibre_retention
LIMIT 5;

SELECT DISTINCT event_name
FROM mercadolibre_funnel
ORDER BY event_name;
