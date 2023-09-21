class Report {
  final int idreporte;
  final int idtipo;
  final int id;
  final String ubicacion;
  final String fechareporte;
  final String fechaarreglo;
  final String foto;
  final String senal;

  Report(
    this.idreporte,
    this.idtipo,
    this.id,
    this.ubicacion,
    this.fechareporte,
    this.fechaarreglo,
    this.foto,
    this.senal,
  );
  factory Report.fromMap(Map<String, dynamic> json) {
    return Report(json['idreporte'], json['idtipo'], json['id'], json['ubicacion'], json['fechareporte'], json['fechaarreglo'], json['foto'],json['senal']);
  }
  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(json['idreporte'], json['idtipo'], json['id'], json['ubicacion'], json['fechareporte'],json['fechaarreglo'], json['foto'],json['senal']);
  }
}
