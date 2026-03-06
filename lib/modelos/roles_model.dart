class RolModel {
  final String nombreRol;
  final String codigoRol;
  final String descripcion;

  RolModel(this.nombreRol, this.codigoRol, this.descripcion);
}

class Roles {
  final List<RolModel> rolesLista = [
    RolModel(
      "Administrador",
      "ROL001",
      "Acceso completo al sistema, gestión de usuarios, productos y facturación.",
    ),
    RolModel(
      "Cajero",
      "ROL002",
      "Encargado de registrar ventas y generar facturas.",
    ),
    RolModel(
      "Vendedor",
      "ROL003",
      "Gestiona clientes y realiza ventas en el sistema.",
    ),
    RolModel(
      "Bodeguero",
      "ROL004",
      "Administra inventario, stock y movimientos de productos.",
    ),
    RolModel(
      "Supervisor",
      "ROL005",
      "Supervisa operaciones y revisa reportes del sistema.",
    ),
    RolModel(
      "Contador",
      "ROL006",
      "Acceso a reportes financieros y control de facturación.",
    ),
  ];
}

List<String> columnasRoles = ['ROL', 'CÓDIGO', 'DESCRIPCIÓN', ''];
