# Análisis de embudo de conversión y retención de usuarios en e-commerce

**Proyecto de análisis de datos | SQL · Excel · Análisis de negocio**

## Descripción del proyecto

En este proyecto analizo el comportamiento de los usuarios de una plataforma de comercio electrónico, utilizando un caso de estudio académico contextualizado en MercadoLibre.

Mi objetivo es comprender cómo avanzan los usuarios a través de las diferentes etapas del proceso de compra, identificar los principales puntos de abandono y evaluar su permanencia en la plataforma mediante indicadores de retención y análisis de cohortes.

Para ello, utilizo consultas SQL para explorar, segmentar y agregar los datos, así como Excel para organizar los resultados, comparar indicadores y comunicar hallazgos y recomendaciones de negocio.

*Este proyecto fue desarrollado como parte de mi formación en Análisis de Datos en TripleTen. No corresponde a un estudio oficial, encargado o validado por MercadoLibre.*

## Objetivos del análisis

- Identificar las etapas del embudo de conversión y evaluar la participación de los usuarios en cada una.
- Comparar las tasas de conversión entre los 10 países incluidos en el análisis.
- Examinar el comportamiento de retención de usuarios en distintos periodos posteriores al registro.
- Analizar las diferencias de retención entre países y cohortes mensuales.
- Transformar los resultados en hallazgos e implicaciones que apoyen la toma de decisiones de negocio.

## Datos y alcance

El proyecto utiliza dos tablas del entorno académico de TripleTen:

| Tabla | Descripción |
|---|---|
| `mercadolibre_funnel` | Registros de eventos del recorrido de los usuarios, desde la primera visita hasta la compra. |
| `mercadolibre_retention` | Información de registro y actividad de usuarios para analizar su comportamiento a lo largo del tiempo. |

**Periodo de análisis:** del 1 de enero al 31 de agosto de 2025.

**Segmentación:** países y cohortes mensuales de usuarios.

Las consultas se desarrollaron sobre las tablas disponibles en TripleTen. Los datos originales no están incluidos en este repositorio.

## Herramientas y habilidades aplicadas

**SQL**
- Exploración de datos mediante `SELECT`, `DISTINCT` y filtros.
- Construcción de consultas con Common Table Expressions (`WITH` y CTEs).
- Integración de información mediante `LEFT JOIN`.
- Agrupaciones y agregaciones con `GROUP BY`, `COUNT` y `COUNT(DISTINCT)`.
- Cálculo de porcentajes mediante operaciones aritméticas y `NULLIF`.
- Análisis condicional mediante `CASE WHEN`.
- Segmentación temporal y construcción de cohortes.

**Excel**
- Organización de resultados analíticos.
- Elaboración de tablas comparativas por país y cohorte.
- Presentación de indicadores de conversión y retención.
- Desarrollo de un informe ejecutivo con hallazgos y recomendaciones.

**Competencias analíticas**
- Análisis de embudos de conversión.
- Análisis de retención y cohortes.
- Interpretación de indicadores de negocio.
- Identificación de oportunidades de mejora.
- Comunicación de resultados mediante el enfoque Contexto → Hallazgo → Implicación.

## Metodología

### 1. Exploración inicial de datos

Comienzo examinando las tablas disponibles y los eventos registrados para comprender su estructura y reconocer las variables necesarias para el análisis.

Identifico los eventos que componen el recorrido del usuario, desde `first_visit` hasta `purchase`.

### 2. Construcción del embudo de conversión

Utilizo CTEs para identificar usuarios únicos asociados a las distintas etapas del recorrido de compra:

1. Primera visita (`first_visit`).
2. Selección de producto o promoción (`select_item` / `select_promotion`).
3. Agregar al carrito (`add_to_cart`).
4. Inicio del checkout (`begin_checkout`).
5. Información de envío (`add_shipping_info`).
6. Información de pago (`add_payment_info`).
7. Compra (`purchase`).

Posteriormente, integro los resultados mediante `LEFT JOIN` y calculo el porcentaje de usuarios de la etapa inicial que registraron cada evento.

### 3. Segmentación del embudo por país

Agrupo los resultados por país para identificar diferencias en el comportamiento de los usuarios.

Esta comparación me permite reconocer mercados con mayores niveles de participación y detectar etapas donde podría ser conveniente investigar posibles barreras en el proceso de compra.

### 4. Análisis de retención

Analizo la actividad de usuarios en distintos periodos posteriores a su registro, utilizando referencias temporales de 7, 14, 21 y 28 días.

Las consultas originales utilizan condiciones de actividad desde cada umbral temporal (`>= 7`, `>= 14`, `>= 21` y `>= 28`). Por ello, estos resultados no deben interpretarse como tasas de actividad exclusivamente en el día exacto.

### 5. Análisis de cohortes

Agrupo a los usuarios según el mes de registro para comparar su comportamiento posterior.

Este procedimiento permite estudiar diferencias entre grupos de usuarios y explorar posibles oportunidades para mejorar su permanencia en la plataforma.

### 6. Informe ejecutivo

Finalmente, organizo los indicadores en Excel y desarrollo un informe con los principales hallazgos, sus implicaciones y posibles líneas de acción para el negocio.

## Principales hallazgos

### 1. Abandono en el proceso de compra

El análisis del embudo identifica una disminución importante en la participación de usuarios entre la selección de productos o promociones y el evento de agregar al carrito.

Esta diferencia sugiere una oportunidad para investigar factores que podrían afectar la intención de compra, como la claridad de la información del producto, los costos adicionales o la experiencia de navegación.

### 2. Diferencias entre países

La segmentación geográfica muestra que los indicadores de participación y conversión no presentan el mismo comportamiento en todos los países analizados.

Estas diferencias permiten identificar mercados que requieren mayor atención y plantear análisis específicos antes de implementar mejoras.

### 3. Retención de usuarios

El análisis muestra diferencias en la actividad de los usuarios entre los distintos umbrales temporales y cohortes.

Estos resultados permiten explorar oportunidades relacionadas con la experiencia posterior al registro, la recurrencia de uso y las estrategias de reactivación.

## Recomendaciones e implicaciones de negocio

A partir de los resultados, identifico tres líneas de acción que podrían evaluarse:

**Optimización del proceso de compra:** investigar las principales causas de abandono entre la selección de productos y la incorporación al carrito, antes de implementar cambios en la experiencia de usuario.

**Estrategias diferenciadas por país:** profundizar en los mercados que presentan menores tasas de participación, considerando sus características comerciales y el comportamiento de sus usuarios.

**Fortalecimiento de la retención:** analizar estrategias de incorporación, comunicación y reactivación de usuarios, complementando los indicadores disponibles con métricas de recurrencia y comportamiento por cohorte.

Estas propuestas representan oportunidades de investigación y mejora, no resultados comprobados de intervenciones realizadas.

## Archivos del repositorio

| Archivo | Contenido |
|---|---|
| [Informe de análisis en Excel](analisis_embudo_retencion.xlsx) | Resultados de conversión, comparaciones por país, retención, cohortes e informe ejecutivo. |
| [01_exploracion.sql](sql/01_exploracion.sql) | Consultas de exploración inicial. |
| [02_embudo_general.sql](sql/02_embudo_general.sql) | Construcción del embudo general de conversión. |
| [03_embudo_por_pais.sql](sql/03_embudo_por_pais.sql) | Segmentación del embudo por país. |
| [04_retencion_por_pais.sql](sql/04_retencion_por_pais.sql) | Análisis de actividad posterior al registro por país. |
| [05_retencion_por_cohorte.sql](sql/05_retencion_por_cohorte.sql) | Análisis de retención por cohorte mensual. |

## Reproducibilidad y limitaciones

- Las consultas fueron desarrolladas en el entorno académico de TripleTen y requieren acceso a sus tablas para ejecutarse con los datos originales.
- Las tasas del embudo utilizan como referencia a los usuarios con evento `first_visit`; no representan necesariamente conversiones entre etapas consecutivas.
- La presencia de eventos en las consultas no garantiza por sí sola que hayan ocurrido en orden cronológico.
- Las métricas de retención utilizan umbrales de días transcurridos desde el registro, por lo que deben interpretarse de acuerdo con las condiciones del código.
- La ventana temporal disponible puede afectar el seguimiento de las cohortes más recientes.
- Los resultados corresponden a un caso de estudio académico y no deben generalizarse a las operaciones reales de MercadoLibre.
- Para validar completamente los indicadores sería necesario revisar las definiciones de negocio, la secuencia de eventos y la disponibilidad de seguimiento de cada cohorte.

## Conclusión

Este proyecto me permitió aplicar SQL para transformar registros de actividad en indicadores de conversión y retención, así como fortalecer mi capacidad para interpretar resultados desde una perspectiva de negocio.

Uno de mis principales aprendizajes fue comprender que calcular una métrica es solamente una parte del análisis: también es necesario evaluar su definición, sus limitaciones y su utilidad para responder preguntas concretas.

El proyecto forma parte de mi portafolio profesional como Analista de Datos y refleja mis habilidades en SQL, análisis de usuarios y comunicación de hallazgos orientados a la toma de decisiones.

---

*Proyecto académico desarrollado durante el Sprint 4 del programa de Data Analyst de TripleTen.*
