class CardapioApiModel {
  int? code;
  List<Result>? result;

  CardapioApiModel({this.code, this.result});

  CardapioApiModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? id;
  String? nome;
  String? imagem;
  int? categoria;
  String? valor;
  String? ingredientes;

  Result(
      {this.id,
      this.nome,
      this.imagem,
      this.categoria,
      this.valor,
      this.ingredientes});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    imagem = json['imagem'];
    categoria = json['categoria'];
    valor = json['valor'];
    ingredientes = json['ingredientes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['imagem'] = this.imagem;
    data['categoria'] = this.categoria;
    data['valor'] = this.valor;
    data['ingredientes'] = this.ingredientes;
    return data;
  }
}
