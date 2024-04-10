import 'package:flutter/material.dart';
import 'package:login_cadastro/database/user_database.dart';
import 'package:login_cadastro/ui/widgets/circleAvatar.dart';
import 'package:login_cadastro/ui/widgets/myAppBar.dart';
import 'package:login_cadastro/ui/widgets/text.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final UserDataBase userDataBase = UserDataBase();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(texto: 'Meu Perfil'),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              circleAvatar('assets/img/profile.jpg'),
              const Icon(Icons.edit),
              Text("Olá, ${userDataBase.users[0].name}",
                  style: const TextStyle(fontSize: 24)),
              const SizedBox(
                width: 40.0,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ClicavelTextLogout(
                  text: 'Sair',
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Meus Dados',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: "Alterar meu nome", border: OutlineInputBorder()),
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                  hintText: "Alterar minha senha", border: OutlineInputBorder()),
            ),
          ],
        ),
      ]),
    );
  }
}
