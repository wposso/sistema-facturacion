enum Categoria { frutas, carnes, panaderia, lacteos, aseo, abarrotes, bebidas }

class ProductosModel {
  final String nombreProducto;
  final Categoria categoria;
  final String codigoReferencia;
  final double precioCompra;
  final double precioVenta;
  final int cantidadStock;
  final String detalleProducto;

  ProductosModel(
    this.nombreProducto,
    this.categoria,
    this.codigoReferencia,
    this.precioCompra,
    this.precioVenta,
    this.cantidadStock,
    this.detalleProducto,
  );
}

class Productos {
  double get totalPrecioVenta {
    return productosLista.fold(0, (sum, item) => sum + item.precioVenta);
  }

  double get totalPrecioCompra {
    return productosLista.fold(0, (sum, item) => sum + item.precioCompra);
  }

  final List<ProductosModel> productosLista = [
    ProductosModel(
      "Arroz Diana 1Kg",
      Categoria.abarrotes,
      "ARZ001",
      2.500,
      3.200,
      100,
      "Arroz blanco premium 1 kilogramo",
    ),

    ProductosModel(
      "Leche Alpina Entera 1L",
      Categoria.lacteos,
      "LCH001",
      2.800,
      3.500,
      80,
      "Leche entera larga vida 1 litro",
    ),

    ProductosModel(
      "Pan Tajado Bimbo",
      Categoria.panaderia,
      "PAN001",
      4.200,
      5.000,
      60,
      "Pan blanco tajado 500g",
    ),

    ProductosModel(
      "Coca-Cola 1.5L",
      Categoria.bebidas,
      "BEB001",
      4.500,
      5.500,
      90,
      "Gaseosa Coca-Cola botella 1.5 litros",
    ),

    ProductosModel(
      "Pechuga de Pollo 1Kg",
      Categoria.carnes,
      "CAR001",
      11.000,
      13.500,
      40,
      "Pechuga de pollo fresca por kilogramo",
    ),

    ProductosModel(
      "Detergente Ariel 1Kg",
      Categoria.aseo,
      "ASE001",
      9.000,
      11.500,
      35,
      "Detergente en polvo Ariel 1Kg",
    ),

    ProductosModel(
      "Huevos AA x30",
      Categoria.abarrotes,
      "HUE001",
      15.000,
      17.500,
      50,
      "Cubeta de huevos AA por 30 unidades",
    ),

    ProductosModel(
      "Aceite Premier 1L",
      Categoria.abarrotes,
      "ACE001",
      7.000,
      8.500,
      70,
      "Aceite vegetal 1 litro",
    ),

    ProductosModel(
      "Papel Higiénico Scott x4",
      Categoria.aseo,
      "ASE002",
      6.000,
      7.500,
      65,
      "Paquete papel higiénico 4 rollos",
    ),

    ProductosModel(
      "Azúcar Manuelita 1Kg",
      Categoria.abarrotes,
      "AZU001",
      3.000,
      3.800,
      120,
      "Azúcar refinada 1 kilogramo",
    ),
  ];
}

List<String> columnasProductos = [
  'PRODUCTO',
  'CÓDIGO',
  'CATEGORÍA',
  'STOCK',
  'COMPRA',
  'VENTA',
  'DETALLE',
  '',
];
