import 'package:flutter/material.dart';
import 'package:login_cadastro/database/user_database.dart';
import 'package:login_cadastro/model/user_model.dart';
import 'package:login_cadastro/ui/pages/homepage.dart';

class UserController {
  UserDataBase userDataBase = UserDataBase();

  void login(context, String name, String password) {
    //passamos os valores que estao na lista de usuarios para a variavel lista
    var userList = userDataBase.users;

    //uso um iterador para percorrer a lista e verificar se existe op nome passado
    //armazeno o resultado dessa iteração na variável result
    var result = userList
        .where((item) => item.name == name && item.password == password);

    if (result.isNotEmpty) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => HomePage()),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red, content: Text('Senha Invalida')));
    }
  }

  void register(context, String name, String password) {
    var userList = userDataBase.users;

    if (userList.any((user) => user.name == name)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red, content: Text('Usuario Já existe')));
    } else {
      userList.add(User(name: name, password: password));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.lightGreenAccent,
          content: Text('Usuario Cadastrado')));

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
      });
    }
  }
}
