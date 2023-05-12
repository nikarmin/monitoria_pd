class Monitor {
  int id = 0;
  String nome = "";
  String email = "";
  String curso = "";
  String horarios = "";
  String imagem = "";

  Monitor(int id, String nome, String email, String curso, String horarios,
      String imagem) {
    this.id = id;
    this.nome = nome;
    this.email = email;
    this.curso = curso;
    this.horarios = horarios;
    this.imagem = imagem;
  }

  Monitor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    curso = json['curso'];
    horarios = json['horarios'];
    imagem = json['imagem'];
  }

  Map toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'curso': curso,
      'horarios': horarios,
      'imagem': imagem
    };
  }
}
