# inspeccion.R — Tipos, columna derivada e indicadores (R)
# Completa los pasos marcados con TODO. Ejecuta desde la raíz del repositorio:
#   Rscript scripts/inspeccion.R

# TODO 1: carga data/ventas.csv
# stringsAsFactors = FALSE fuerza que los textos lleguen como character
ventas <- read.csv("data/ventas.csv", stringsAsFactors = FALSE)

# TODO 2: imprime la estructura (str) para ver los tipos
str(ventas)


# TODO 3: crea la columna derivada "ticket" = ventas / clientes
ventas$ticket <- ventas$ventas / ventas$clientes

# TODO 4: indicadores
# - venta promedio por sucursal
prom_sucursal <- aggregate(ventas ~ sucursal, data = ventas, FUN = mean)
cat("Venta promedio por sucursal:\n")
print(prom_sucursal)
cat("\n")

# - ticket promedio (ventas totales / clientes totales)
ticket_prom <- sum(ventas$ventas) / sum(ventas$clientes)
cat(sprintf("Ticket promedio: %.2f\n\n", ticket_prom))

# - sucursal con mayor y menor venta (según venta total)
total_sucursal <- aggregate(ventas ~ sucursal, data = ventas, FUN = sum)
mayor <- total_sucursal[which.max(total_sucursal$ventas), ]
menor <- total_sucursal[which.min(total_sucursal$ventas), ]
cat(sprintf("Sucursal con mayor venta: %s (%.2f)\n", mayor$sucursal, mayor$ventas))
cat(sprintf("Sucursal con menor venta: %s (%.2f)\n\n", menor$sucursal, menor$ventas))

# - región con mayor venta total
total_region <- aggregate(ventas ~ region, data = ventas, FUN = sum)
top_region <- total_region[which.max(total_region$ventas), ]
cat(sprintf("Región con mayor venta total: %s (%.2f)\n", top_region$region, top_region$ventas))