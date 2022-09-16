// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_final_fields, unrelated_type_equality_checks, unused_label, unused_local_variable
import 'package:uuid/uuid.dart';

import 'package:projeto_final_poo/models/endereco/endereco.dart';
import 'package:projeto_final_poo/models/pessoa_fisica/pessoa_fisica..dart';
import 'package:projeto_final_poo/models/pessoa_juridica/pessoa_juridica.dart';
import 'package:projeto_final_poo/models/telefone/telefone.dart';

class Empresa {
  var id = Uuid().v4();
  String? nomeSocio;
  String? razaoSocial;
  String? nomeFantasia;
  String? cnpj;
  Endereco? enderecoEmpresa;
  Endereco? enderecoSocio;
  Telefone? telefone;
  final horarioCadastro = DateTime.now();
  PessoaFisica? pessoaFisica;
  PessoaJuridica? pessoaJuridica;
  bool tipo;

  Empresa({
    required this.nomeSocio,
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.cnpj,
    required this.enderecoEmpresa,
    required this.enderecoSocio,
    required this.telefone,
    required this.pessoaFisica,
    required this.pessoaJuridica,
    required this.tipo,
  });


}
