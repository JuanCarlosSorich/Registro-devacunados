// ignore_for_file: file_names

class Registro {
  final String carnet;
  final String nombreCompleto;
  final String vacuna;

  Registro({
    required this.carnet,
    required this.nombreCompleto,
    required this.vacuna,
  });

  factory Registro.fromJson(Map<String, dynamic> json) {
    return Registro(
      carnet: json['carnet'],
      nombreCompleto: json['nombreCompleto'],
      vacuna: json['vacuna'],
    );
  }
}