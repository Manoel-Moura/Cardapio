class ProdutoApiModel {
  String? nome;
  String? ingredientes;
  double? preco;
  String? categoria;
  String? imagemurl;

  ProdutoApiModel(
      {this.nome,
      this.ingredientes,
      this.preco,
      this.categoria,
      this.imagemurl});

  ProdutoApiModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    ingredientes = json['ingredientes'];
    preco = json['preco'];
    categoria = json['categoria'];
    imagemurl = json['imagemurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['ingredientes'] = this.ingredientes;
    data['preco'] = this.preco;
    data['categoria'] = this.categoria;
    data['imagemurl'] = this.imagemurl;
    return data;
  }
}
