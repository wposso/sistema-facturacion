class ClienteModel {
  final String nombreCliente;
  final String tipoDocumento;
  final String documento;
  final String direccion;
  final String telefono;
  final String email;

  ClienteModel(
    this.nombreCliente,
    this.tipoDocumento,
    this.documento,
    this.direccion,
    this.telefono,
    this.email,
  );
}

class Clientes {
  final List<ClienteModel> clientesLista = [
    ClienteModel(
      "Juan Pérez González",
      "Cédula de Ciudadanía",
      "1234567890",
      "Carrera 45 # 23-12, Bogotá",
      "3101234567",
      "juan.perez@email.com",
    ),
    ClienteModel(
      "María Rodríguez López",
      "Cédula de Ciudadanía",
      "9876543210",
      "Calle 80 # 15-30, Medellín",
      "3207654321",
      "maria.rodriguez@email.com",
    ),
    ClienteModel(
      "Comercializadora ABC SAS",
      "NIT",
      "900123456-7",
      "Avenida El Dorado # 68-91, Bogotá",
      "6012345678",
      "contacto@comercializadoraabc.com",
    ),
    ClienteModel(
      "Carlos Mendoza",
      "Cédula de Extranjería",
      "E-1234567",
      "Calle 72 # 10-42, Cali",
      "3156789012",
      "carlos.mendoza@email.com",
    ),
    ClienteModel(
      "Ana María Restrepo",
      "Cédula de Ciudadanía",
      "4567890123",
      "Carrera 43 # 30-15, Barranquilla",
      "3054321098",
      "ana.restrepo@email.com",
    ),
    ClienteModel(
      "Inversiones del Norte Ltda",
      "NIT",
      "800456789-2",
      "Calle 34 # 12-45, Bucaramanga",
      "6078901234",
      "gerencia@inversionesnorte.com",
    ),
  ];
}

List<String> columnasClientes = [
  'NOMBRE',
  'DOCUMENTO',
  'DIRECCIÓN',
  'TELÉFONO',
  'EMAIL',
  '',
];
