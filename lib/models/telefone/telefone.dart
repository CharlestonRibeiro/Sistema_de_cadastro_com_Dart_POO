class Telefone {
  String ddd;
  String telefone;

  Telefone({
    required this.ddd,
    required this.telefone,
  });

  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'telefone': telefone
    };
  }
}
