class CategoriaModel {
  final String nombreCategoria;
  final String codigoCategoria;
  final String descripcion;

  CategoriaModel(this.nombreCategoria, this.codigoCategoria, this.descripcion);
}

class Categorias {
  final List<CategoriaModel> categoriasLista = [
    CategoriaModel(
      "Frutas",
      "CAT001",
      "Productos naturales como manzanas, bananos, naranjas y otras frutas.",
    ),
    CategoriaModel(
      "Carnes",
      "CAT002",
      "Carnes rojas, pollo, cerdo y productos cárnicos.",
    ),
    CategoriaModel(
      "Panadería",
      "CAT003",
      "Productos de panadería como pan, galletas y repostería.",
    ),
    CategoriaModel(
      "Lácteos",
      "CAT004",
      "Productos derivados de la leche como queso, yogurt y mantequilla.",
    ),
    CategoriaModel(
      "Aseo",
      "CAT005",
      "Productos de limpieza para el hogar y uso personal.",
    ),
    CategoriaModel(
      "Abarrotes",
      "CAT006",
      "Productos básicos de despensa como arroz, azúcar y granos.",
    ),
    CategoriaModel(
      "Bebidas",
      "CAT007",
      "Bebidas gaseosas, jugos, agua y bebidas energéticas.",
    ),
  ];
}

List<String> columnasCategorias = ['CATEGORÍA', 'CÓDIGO', 'DESCRIPCIÓN', ''];
