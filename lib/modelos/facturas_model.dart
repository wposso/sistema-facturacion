class FacturaModel {
  final String numeroFactura;
  final String cliente;
  final String empleado;
  final List<ProductoFactura> productos;
  final double total;
  final DateTime fechaEmitido;
  final String observaciones;

  FacturaModel(
    this.numeroFactura,
    this.cliente,
    this.empleado,
    this.productos,
    this.total,
    this.fechaEmitido,
    this.observaciones,
  );
}

class ProductoFactura {
  final String nombreProducto;
  final int cantidad;
  final double precioUnitario;
  final double subtotal;

  ProductoFactura(
    this.nombreProducto,
    this.cantidad,
    this.precioUnitario,
    this.subtotal,
  );
}

class Facturas {
  final List<FacturaModel> facturasLista = [
    FacturaModel(
      "FAC-001",
      "Juan Pérez González",
      "Carlos Martínez",
      [
        ProductoFactura("Arroz Diana 1Kg", 2, 3200, 6400),
        ProductoFactura("Aceite Gourmet 900ml", 1, 8500, 8500),
        ProductoFactura("Azúcar Manuelita 500g", 3, 2800, 8400),
      ],
      23300,
      DateTime(2025, 2, 15, 10, 30),
      "Cliente frecuente",
    ),
    FacturaModel(
      "FAC-002",
      "María Rodríguez López",
      "Laura Sánchez",
      [
        ProductoFactura("Leche Colanta 1L", 6, 3200, 19200),
        ProductoFactura("Huevos Santa Reyes 30u", 2, 15200, 30400),
      ],
      49600,
      DateTime(2025, 2, 16, 15, 45),
      "Entrega a domicilio",
    ),
    FacturaModel(
      "FAC-003",
      "Comercializadora ABC SAS",
      "Jorge Gómez",
      [
        ProductoFactura("Laptop HP Pavilion", 3, 2500000, 7500000),
        ProductoFactura("Mouse Inalámbrico", 5, 45000, 225000),
        ProductoFactura("Teclado Mecánico", 3, 120000, 360000),
      ],
      8085000,
      DateTime(2025, 2, 17, 9, 15),
      "Factura corporativa",
    ),
    FacturaModel(
      "FAC-004",
      "Carlos Mendoza",
      "Laura Sánchez",
      [
        ProductoFactura("Camisa Manga Larga", 2, 75000, 150000),
        ProductoFactura("Pantalón Jean", 1, 120000, 120000),
        ProductoFactura("Zapatos Casuales", 1, 180000, 180000),
      ],
      450000,
      DateTime(2025, 2, 18, 14, 20),
      "Cambio de talla autorizado",
    ),
    FacturaModel(
      "FAC-005",
      "Ana María Restrepo",
      "Pedro Ramírez",
      [
        ProductoFactura("Lavadora Secadora", 1, 1200000, 1200000),
        ProductoFactura("Nevera No Frost", 1, 1800000, 1800000),
      ],
      3000000,
      DateTime(2025, 2, 19, 11, 0),
      "Electrodomésticos línea blanca",
    ),
  ];
}

List<String> columnasFacturas = ['N° FACTURA', 'CLIENTE', 'TOTAL', 'FECHA', ''];
