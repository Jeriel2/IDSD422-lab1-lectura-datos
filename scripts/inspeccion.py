# inspeccion.py — Tipos, columna derivada e indicadores (Python)
# Completa los pasos marcados con TODO. Ejecuta desde la raíz del repositorio:
#   python scripts/inspeccion.py

import pandas as pd

# TODO 1: carga data/ventas.csv
ventas = pd.read_csv("data/ventas.csv")

# TODO 2: imprime los tipos (dtypes) de cada columna
print("Tipos de cada columna:")
print(ventas.dtypes)
print()

# TODO 3: crea la columna derivada "ticket" = ventas / clientes
ventas["ticket"] = ventas["ventas"] / ventas["clientes"]

# TODO 4: indicadores
# - venta promedio por sucursal
prom_sucursal = ventas.groupby("sucursal")["ventas"].mean()
print("Venta promedio por sucursal:")
print(prom_sucursal)
print()

# - ticket promedio (ventas totales / clientes totales)
ticket_prom = ventas["ventas"].sum() / ventas["clientes"].sum()
print(f"Ticket promedio: {ticket_prom:.2f}")
print()

# - sucursal con mayor y menor venta (según venta total)
total_sucursal = ventas.groupby("sucursal")["ventas"].sum()
print(f"Sucursal con mayor venta: {total_sucursal.idxmax()} ({total_sucursal.max():,.2f})")
print(f"Sucursal con menor venta: {total_sucursal.idxmin()} ({total_sucursal.min():,.2f})")
print()

# - región con mayor venta total
total_region = ventas.groupby("region")["ventas"].sum()
print(f"Región con mayor venta total: {total_region.idxmax()} ({total_region.max():,.2f})")