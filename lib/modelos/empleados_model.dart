class EmpleadoModel {
  final String nombreEmpleado;
  final String tipoDocumento;
  final String documento;
  final String direccion;
  final String telefono;
  final String email;
  final String rolEmpleado;
  final DateTime fechaIngreso;
  final DateTime? fechaRetiro;
  final String datosAdicionales;

  EmpleadoModel(
    this.nombreEmpleado,
    this.tipoDocumento,
    this.documento,
    this.direccion,
    this.telefono,
    this.email,
    this.rolEmpleado,
    this.fechaIngreso,
    this.fechaRetiro,
    this.datosAdicionales,
  );
}

class Empleados {
  final List<EmpleadoModel> empleadosLista = [
    EmpleadoModel(
      "Carlos Martínez",
      "Cédula de Ciudadanía",
      "123456789",
      "Calle 45 # 23-12, Bogotá",
      "3101234567",
      "carlos.martinez@empresa.com",
      "Administrador",
      DateTime(2023, 1, 15),
      null,
      "Administrador del sistema",
    ),
    EmpleadoModel(
      "Laura Sánchez",
      "Cédula de Ciudadanía",
      "987654321",
      "Carrera 30 # 15-20, Medellín",
      "3207654321",
      "laura.sanchez@empresa.com",
      "Vendedor",
      DateTime(2023, 3, 10),
      null,
      "Vendedor zona norte",
    ),
    EmpleadoModel(
      "Pedro Ramírez",
      "Cédula de Ciudadanía",
      "456789123",
      "Calle 80 # 12-34, Cali",
      "3156789012",
      "pedro.ramirez@empresa.com",
      "Bodeguero",
      DateTime(2022, 6, 20),
      DateTime(2024, 1, 15),
      "Renunció voluntariamente",
    ),
    EmpleadoModel(
      "Ana Torres",
      "Cédula de Extranjería",
      "E-789123",
      "Avenida 68 # 45-67, Barranquilla",
      "3054321098",
      "ana.torres@empresa.com",
      "Contador",
      DateTime(2023, 9, 5),
      null,
      "Contador público titulado",
    ),
    EmpleadoModel(
      "Jorge Gómez",
      "Cédula de Ciudadanía",
      "321654987",
      "Carrera 50 # 20-30, Bucaramanga",
      "3178901234",
      "jorge.gomez@empresa.com",
      "Supervisor",
      DateTime(2022, 11, 1),
      null,
      "Supervisor de ventas",
    ),
  ];
}

List<String> columnasEmpleados = [
  'NOMBRE',
  'DOCUMENTO',
  'ROL',
  'TELÉFONO',
  'EMAIL',
  'INGRESO',
  '',
];
