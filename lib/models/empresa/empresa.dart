// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_final_fields, unrelated_type_equality_checks, unused_label, unused_local_variable
import 'package:uuid/uuid.dart';

import 'package:projeto_final_poo/models/endereco/endereco.dart';
import 'package:projeto_final_poo/models/pessoa_fisica/pessoa_fisica..dart';
import 'package:projeto_final_poo/models/pessoa_juridica/pessoa_juridica.dart';
import 'package:projeto_final_poo/models/telefone/telefone.dart';

class Empresa {
  var id = Uuid();
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

  map(String Function(dynamic empresa) param0) {}
/*
 get getCnpj {
     return _cnpj;
  }

  String setCnpj(String dado) {
    String resul =
        // ignore: unnecessary_string_interpolations, prefer_adjacent_string_concatenation
        '${dado.substring(0, 1)}'+'.'+'${dado.substring(2, 4)}'+'.'+'${dado.substring(5,7)}'+'/'+'${dado.substring(8, 11)}'+'-'+'${dado.substring(12, 13)}';
    return resul;
  }
  */
}
