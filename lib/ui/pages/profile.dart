import 'package:flutter/material.dart';
import 'package:login_cadastro/database/user_database.dart';
import 'package:login_cadastro/ui/widgets/circleAvatar.dart';
import 'package:login_cadastro/ui/widgets/myAppBar.dart';
import 'package:login_cadastro/ui/widgets/text.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  UserDataBase userDataBase = UserDataBase();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(texto: 'Seu Perfil'),
      body: ListView(children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
              children: [
                circleAvatar('assets/img/profile.jpg'),
                Text("Olá, ${userDataBase.users[0].name}",
                    style: const TextStyle(fontSize: 24)),
                    const SizedBox(width: 40.0,),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ClicavelTextLogout(
                      text: 'Sair',
                    ),
                ),
              ],
            ),
           ),
      ]),
    );
  }
}
