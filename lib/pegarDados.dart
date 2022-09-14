// ignore_for_file: file_names, unused_local_variable, unused_element, body_might_complete_normally_nullable, unrelated_type_equality_checks, unnecessary_null_comparison, unnecessary_type_check

import 'dart:io';

import 'package:projeto_final_poo/models/empresa/empresa.dart';
import 'package:projeto_final_poo/models/endereco/endereco.dart';
import 'package:projeto_final_poo/models/pessoa_fisica/pessoa_fisica..dart';
import 'package:projeto_final_poo/models/pessoa_juridica/pessoa_juridica.dart';
import 'package:projeto_final_poo/models/telefone/telefone.dart';

class PegarDados {
  int? escolhaPainel;
  late bool tipoEscolha;

  Empresa? cadastroEmpresa() {
    print("Qual o nome do socio da empresa?");
    String nome = tratarErro();

    print("Qual a razao social da empresa?");
    var razaoSocial = tratarErro();

    print("Qual nome fantazia da empresa?");
    var nomeFantasia = tratarErro();

      print("Qual cnpj da empresa, apenas os numeros?");

     var cnpj = tratarCNPJ();

     var enderecoEmpresa = criarEnderecoEmpresa();

     var telefoneEmpresa = criarTelefone();

      print('''Qual o tipo do Socio: 
              1 - Pessoa Fisica
              2 - Pessoa Juridica''');

      escolhaPainel = tratarErroInt();

      switch (escolhaPainel) {
        case 1:
          //socio pessoa fisica
          tipoEscolha = true;
          break;

        case 2:
          //socio pessoa juridica
          tipoEscolha = false;
          break;

        default:
          print('Escolha invalida!');
          print('');
          break;
      }
    

    if (tipoEscolha == true) {
      return Empresa(
          nomeFantasia: nomeFantasia,
          razaoSocial: razaoSocial,
          cnpj: cnpj,
          telefone: telefoneEmpresa,
          enderecoEmpresa: enderecoEmpresa,
          nomeSocio: nome,
          tipo: tipoEscolha,
          pessoaFisica: cadastroPessoaFisica(),
          enderecoSocio: criarEnderecoSocio(),
          pessoaJuridica: null);
    } else if (tipoEscolha == false) {
      return Empresa(
          nomeFantasia: nomeFantasia,
          razaoSocial: razaoSocial,
          cnpj: cnpj,
          telefone: telefoneEmpresa,
          enderecoEmpresa: enderecoEmpresa,
          nomeSocio: nome,
          tipo: tipoEscolha,
          pessoaFisica: null,
          pessoaJuridica: cadastroPessoaJuridica(),
          enderecoSocio: null); //criarEnderecoEmpresa());
    }
  }

  PessoaJuridica cadastroPessoaJuridica() {
    print("Qual a razao social do socio?");
    var razaoSocialSocio = tratarErro();

    print("Qual nome fantazia do socio?");
    var nomeFantasiaSocio = tratarErro();

      print("Qual cnpj do socio, apenas os numeros?");
      var cnpjSocio = tratarCNPJ();

    return PessoaJuridica(
      nomeFantasiaPessoaJuridica: nomeFantasiaSocio,
      cnpjPessoaJuridica: cnpjSocio,
      razaoSocialPeassoaJuridica: razaoSocialSocio,
    );
  }

  PessoaFisica cadastroPessoaFisica() {
    print("Qual o Nome do socio?");
    var nomeSocio = tratarErro();

    print("Qual o cpf do socio, apenas os numeros?");
    var cpfSocio = tratarCPF();

    return PessoaFisica(
        cpf: cpfSocio,
        nome: nomeSocio);
  }

  Endereco criarEnderecoSocio() {
    print("Dados endereço do Socio");

    print("Qual o lobradouro do socio?");
    var logradouro = tratarErro();

    print("Qual o numero do socio?");
    var numero = tratarErroInt();

    print("Qual o complemento do socio?");
    var complemento = tratarErro();

    print("Qual o bairro do socio?");
    var bairro = tratarErro();

    print("Qual o estado do socio?");
    var estado = tratarErro();

    print("Qual sua cidade do socio?");
    var cidade = tratarErro();

    print("Qual o cep do socio?");
    var cep = tratarErroInt();

    return Endereco(
        logradouro: logradouro,
        numero: numero,
        complemento: complemento,
        bairro: bairro,
        estado: estado,
        cidade: cidade,
        cep: cep.toString());
  }

  Telefone criarTelefone() {
    print('Cadastro telefone da empresa');

    print("Qual o ddd?");
    var ddd = tratarErroInt();

    print("Qual o numero?");
    var numero = tratarErroInt();

    return Telefone(ddd: ddd.toString(), telefone: numero.toString());
  }

  Endereco criarEnderecoEmpresa() {
    print("Dados endereço da empresa");

    print("Qual o lobradouro da empresa?");
    var logradouro = tratarErro();

    print("Qual o numero da empresa?");
    var numero = tratarErroInt();

    print("Qual o complemento da empresa?");
    var complemento = tratarErro();

    print("Qual o bairro da empresa?");
    var bairro = tratarErro();

    print("Qual o estado da empresa?");
    var estado = tratarErro();

    print("Qual sua cidade da empresa?");
    var cidade = tratarErro();

    print("Qual o cep da empresa?");
    var cep = tratarErro();

    return Endereco(
        logradouro: logradouro,
        numero: numero,
        complemento: complemento,
        bairro: bairro,
        estado: estado,
        cidade: cidade,
        cep: cep);
  }

  String tratarCNPJ() {
    String result;
    String cnpjChecar;

    var cnpj = tratarErroInt();
    cnpjChecar = cnpj.toString();

    while (cnpjChecar.length != 14) {
      print('O CNPJ invalido!! Item deve ter 14 digitos');
      print("Qual cnpj?");
      var cnpj = tratarErroInt();
      cnpjChecar = cnpj.toString();
    }
    result = cnpjChecar.substring(0, 2) +
        '.' +
        cnpjChecar.substring(2, 5) +
        '.' +
        cnpjChecar.substring(5, 8) +
        '/' +
        cnpjChecar.substring(8, 12) +
        '-' +
        cnpjChecar.substring(12, 14);

    return result;
  }

  String tratarCPF() {
    String cpfChecar;
    String result;

    var cpf = tratarErroInt();
    cpfChecar = cpf.toString();

    while (cpfChecar.length != 11) {
      print('O CPF invalido!! Item deve ter 11 digitos');
      print("Qual CPF?");
      var cpf = tratarErroInt();
      cpfChecar = cpf.toString();
    }
    result = cpfChecar.substring(0, 3) +
        '.' +
        cpfChecar.substring(3, 6) +
        '.' +
        cpfChecar.substring(6, 9) +
        '-' +
        cpfChecar.substring(9, 11);

    return result;
  }

  int tratarErroInt() {
    int? escolha = int.tryParse(stdin.readLineSync()!);

    while (escolha == null) {
      print('Valor inválido!!. Escolha um dado válido:');
      escolha = int.tryParse(stdin.readLineSync()!);
    }
    return escolha;
  }

  String tratarErro() {
    String? escolha = stdin.readLineSync();

    while (escolha == '' || escolha == null) {
      print('Valor inválido!!. Escolha um dado válido:');
      escolha = stdin.readLineSync();
    }
    return escolha;
  }
}
