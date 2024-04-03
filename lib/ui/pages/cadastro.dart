import 'package:flutter/material.dart';
import 'package:login_cadastro/ui/widgets/myAppBar.dart';
import 'package:login_cadastro/controller/user_controller.dart';
import 'package:login_cadastro/ui/widgets/text.dart';

class Cadastro extends StatelessWidget {
  Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = UserController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: MyAppBar(texto: 'Cadastrar-se'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: 'Nome de Usuario', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'Insira sua senha', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
                onPressed: () {
                  userController.register(context, nameController.text, passwordController.text);
                },
                child: const Text('Cadastrar')),
                const SizedBox(
                  child: ClicavelText(text: 'Já possui uma conta?'),
                )
                
          ],
        ),
      ),
    );
  }
}
