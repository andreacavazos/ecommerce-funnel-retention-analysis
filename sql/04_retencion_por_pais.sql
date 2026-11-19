-- Retención por país · Consulta original de porcentajes visible en las capturas.
-- ADVERTENCIA: >=7 / >=14 / >=21 / >=28 no equivale a actividad EXACTAMENTE en D7, D14, D21 y D28.
-- La base se restringe por activity_date y el denominador son usuarios con filas en esa ventana.
SELECT
    country,
    ROUND(
        COUNT(DISTINCT CASE WHEN day_after_signup >= 7 AND active = 1 THEN user_id END) * 100.0
        / NULLIF(COUNT(DISTINCT user_id), 0), 1
    ) AS retention_d7_pct,
    ROUND(
        COUNT(DISTINCT CASE WHEN day_after_signup >= 14 AND active = 1 THEN user_id END) * 100.0
        / NULLIF(COUNT(DISTINCT user_id), 0), 1
    ) AS retention_d14_pct,
    ROUND(
        COUNT(DISTINCT CASE WHEN day_after_signup >= 21 AND active = 1 THEN user_id END) * 100.0
        / NULLIF(COUNT(DISTINCT user_id), 0), 1
    ) AS retention_d21_pct,
    ROUND(
        COUNT(DISTINCT CASE WHEN day_after_signup >= 28 AND active = 1 THEN user_id END) * 100.0
        / NULLIF(COUNT(DISTINCT user_id), 0), 1
    ) AS retention_d28_pct
FROM mercadolibre_retention
WHERE activity_date BETWEEN '2025-01-01' AND '2025-08-31'
GROUP BY country
ORDER BY country;
