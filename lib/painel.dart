// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import, unused_local_variable, prefer_collection_literals, non_constant_identifier_names, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps, unrelated_type_equality_checks
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:projeto_final_poo/models/endereco/endereco.dart';
import 'package:projeto_final_poo/pegarDados.dart';
import 'package:projeto_final_poo/models/pessoa_fisica/pessoa_fisica..dart';
import 'package:projeto_final_poo/models/pessoa_juridica/pessoa_juridica.dart';
import 'package:projeto_final_poo/models/empresa/empresa.dart';
import 'package:projeto_final_poo/models/telefone/telefone.dart';

class Painel {
  int? escolha;
  String menu;
  String? cnpjEscolha;
  String? cnpjCpfEscolha;
  String? empresaEscolha;
  List<Empresa> dados = [];
  var dado;

  var pegarDados = PegarDados();

  Painel(
      {this.menu = '''
            Painel de controle:

            1 - Cadastrar uma nova empresa;
            2 - Buscar Empresa cadastrada por CNPJ;
            3 - Buscar Empresa por CPF/CNPJ do Sócio;
            4 - Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social);
            5 - Excluir uma empresa;
            0 - sair
          '''});

  void painel() {

    while (escolha != 0) {
      print(menu);
      escolha = int.parse(stdin.readLineSync()!);

      switch (escolha) {
        case 0:
          fim();
          break;

        case 1:
          cadastro();
          break;

        case 2:
          if (dados.isEmpty) {
            print('Não existem dados cadastrados');
          } else {
            print('Digite o CNPJ da empresa');
            cnpjEscolha = stdin.readLineSync()!;
            buscaEmpresasPorCnpj(cnpjEscolha!);
          }
          break;

        case 3:
          if (dados.isEmpty) {
            print('Não existem dados cadastrados');
          } else {
            print('Digite o CNPJ ou o CPF do socio');
            cnpjCpfEscolha = stdin.readLineSync()!;
            buscaSociosPorCnpjOuCpf(cnpjCpfEscolha!);
          }
          break;

       case 4:
          if (dados.isEmpty) {
            print('Não existem dados cadastrados');
          } else {
            listarDados();
          }
          break;   

        case 5:
          if (dados.isEmpty) {
            print('Não existem dados cadastrados');
          } else {
            print('Digite o ID da empresa que deseja deletar');
            empresaEscolha = stdin.readLineSync()!;
            deletarEmpresa(empresaEscolha!);
            dados.remove(dado);
          }
          break;

        default:
          print('Escolha invalida!');
          print('');
          break;
      }
    }
  }

  void fim() {
    print('.::FIM::.');
  }

  void cadastro() {
    var cadastroEmpresa = pegarDados.cadastroEmpresa();
    dados.add(cadastroEmpresa!);
  }



  void deletarEmpresa(String id) {
    int cont = 0;

    for (var empresa in dados) {
      if (empresa.id == id) {
        cont = 1;
        dado = empresa;
        print('Empresa deletada com sucesso');
      }
    }
    if (cont == 0) {
      print('Empresa não encontrada!!!');
      print('Nomes validos:');
      for (var empresa in dados) {
        print('${empresa.id}');
      }
    }
  }

  void buscaEmpresasPorCnpj(String cnpj) {
    int cont = 0;

    for (var empresa in dados) {
      if (empresa.cnpj == cnpj) {
        cont = 1;
        print('''
             EMPRESA
             Nome Fantasia: ${empresa.nomeFantasia}
             Razão social: ${empresa.razaoSocial}
             Telefone: (${empresa.telefone?.ddd}) ${empresa.telefone?.telefone}
             CNPJ ${empresa.cnpj}
             Horario: ${empresa.horarioCadastro}
             Endereço: ${empresa.enderecoEmpresa?.logradouro} ${empresa.enderecoEmpresa?.numero} ${empresa.enderecoEmpresa?.bairro} ${empresa.enderecoEmpresa?.cidade} ${empresa.enderecoEmpresa?.estado} ${empresa.enderecoEmpresa?.cep}
    ''');

        if (empresa.tipo == true) {
          print('''   
                Socio pessoa Fisica
                   Nome do socio: ${empresa.pessoaFisica?.nome}
                   CPF do socio: ${empresa.pessoaFisica?.cpf}
                   Endereço: ${empresa.enderecoSocio?.logradouro} ${empresa.enderecoSocio?.numero} ${empresa.enderecoSocio?.bairro} ${empresa.enderecoSocio?.cidade} ${empresa.enderecoSocio?.estado} ${empresa.enderecoSocio?.cep}
                ''');
        } else if (empresa.tipo == false) {
          print('''   
                Socio pessoa Juridica
                  Nome Fantasia do socio: ${empresa.pessoaJuridica?.nomeFantasiaPessoaJuridica}
                  Razão social do socio: ${empresa.pessoaJuridica?.razaoSocialPeassoaJuridica}
                  CNPJ do socio ${empresa.pessoaJuridica?.cnpjPessoaJuridica}    
                  Endereço: ${empresa.enderecoSocio?.logradouro} ${empresa.enderecoSocio?.numero} ${empresa.enderecoSocio?.bairro} ${empresa.enderecoSocio?.cidade} ${empresa.enderecoSocio?.estado} ${empresa.enderecoSocio?.cep}
           ''');
        }
      }
    }

    if (cont == 0) {
      print('CNPJ não encontrato!!!');
      print('CNPJ validos:');
      for (var empresa in dados) {
        print('${empresa.cnpj}');
      }
    }
  }

  void buscaSociosPorCnpjOuCpf(String cnpjOuCpf) {
    int cont = 0;
    for (var pessoa in dados) {
      if (pessoa.pessoaFisica?.cpf == cnpjOuCpf ||
          pessoa.pessoaJuridica?.cnpjPessoaJuridica == cnpjOuCpf) {
        cont = 1;
        print('''
            EMPRESA
              ID: ${pessoa.id}
              Nome Fantasia: ${pessoa.nomeFantasia}
              Razão social: ${pessoa.razaoSocial}
              Telefone: (${pessoa.telefone?.ddd}) ${pessoa.telefone?.telefone}
              CNPJ ${pessoa.cnpj}
              Horario: ${pessoa.horarioCadastro}
              Endereço: ${pessoa.enderecoEmpresa?.logradouro} ${pessoa.enderecoEmpresa?.numero} ${pessoa.enderecoEmpresa?.bairro} ${pessoa.enderecoEmpresa?.cidade} ${pessoa.enderecoEmpresa?.estado} ${pessoa.enderecoEmpresa?.cep}
             ''');
      }

      if (pessoa.pessoaFisica?.cpf == cnpjOuCpf) {
        print('''
              Socio
              Nome do socio: ${pessoa.pessoaFisica?.nome}
              CPF do socio: ${pessoa.pessoaFisica?.cpf}
              Endereço: ${pessoa.enderecoSocio?.logradouro} ${pessoa.enderecoSocio?.numero} ${pessoa.enderecoSocio?.bairro} ${pessoa.enderecoSocio?.cidade} ${pessoa.enderecoSocio?.estado} ${pessoa.enderecoSocio?.cep}
    ''');
      } else if (pessoa.pessoaJuridica?.cnpjPessoaJuridica == cnpjOuCpf) {
        print('''
                 Socio
                 Nome Fantasia do socio: ${pessoa.pessoaJuridica?.nomeFantasiaPessoaJuridica}
                 Razão social do socio: ${pessoa.pessoaJuridica?.razaoSocialPeassoaJuridica}
                 CNPJ do socio ${pessoa.pessoaJuridica?.cnpjPessoaJuridica}
                 Endereço: ${pessoa.enderecoSocio?.logradouro} ${pessoa.enderecoSocio?.numero} ${pessoa.enderecoSocio?.bairro} ${pessoa.enderecoSocio?.cidade} ${pessoa.enderecoSocio?.estado} ${pessoa.enderecoSocio?.cep}
                ''');
      }
    }

    if (cont == 0) {
      print('Dado não encontrado');
      print('Dado Validos:');
      for (var empresa in dados) {
        if (empresa.pessoaFisica?.cpf != null) {
          print('CPF: ${empresa.pessoaFisica?.cpf}');
        }

        if (empresa.pessoaJuridica?.cnpjPessoaJuridica != null) {
          print('CNPJ: ${empresa.pessoaJuridica?.cnpjPessoaJuridica}');
        }
      }
    }
  }

  void listarDados() {

    dados.sort((a, b) => a.razaoSocial!.compareTo(b.razaoSocial!));

    for (var empresa in dados) {
      print('''
            EMPRESA
              ID: ${empresa.id}
              Nome Fantasia: ${empresa.nomeFantasia}
              Razão social: ${empresa.razaoSocial}
              DDD: ${empresa.telefone?.ddd}
              Telefone: ${empresa.telefone?.telefone}
              CNPJ ${empresa.cnpj}
              Horario: ${empresa.horarioCadastro}
              Endereço: ${empresa.enderecoEmpresa?.logradouro} ${empresa.enderecoEmpresa?.numero} ${empresa.enderecoEmpresa?.bairro} ${empresa.enderecoEmpresa?.cidade} ${empresa.enderecoEmpresa?.estado} ${empresa.enderecoEmpresa?.cep}
             ''');
      if (empresa.tipo == true) {
        print('''   
           Socio pessoa Fisica
              Nome do socio: ${empresa.pessoaFisica?.nome}
              CPF do socio: ${empresa.pessoaFisica?.cpf}
              Endereço: ${empresa.enderecoSocio?.logradouro} ${empresa.enderecoSocio?.numero} ${empresa.enderecoSocio?.bairro} ${empresa.enderecoSocio?.cidade} ${empresa.enderecoSocio?.estado} ${empresa.enderecoSocio?.cep}
              ''');
      } else if (empresa.tipo == false) {
        print('''   
           Socio pessoa Juridica
              Nome Fantasia do socio: ${empresa.pessoaJuridica?.nomeFantasiaPessoaJuridica}
              Razão social do socio: ${empresa.pessoaJuridica?.razaoSocialPeassoaJuridica}
              CNPJ do socio ${empresa.pessoaJuridica?.cnpjPessoaJuridica}    
              Endereço: ${empresa.enderecoSocio?.logradouro} ${empresa.enderecoSocio?.numero} ${empresa.enderecoSocio?.bairro} ${empresa.enderecoSocio?.cidade} ${empresa.enderecoSocio?.estado} ${empresa.enderecoSocio?.cep}
           ''');
      }
    }
  }
}
