import 'package:flutter/material.dart';
import 'package:login_cadastro/controller/user_controller.dart';
import 'package:login_cadastro/ui/widgets/myAppBar.dart';
import 'package:login_cadastro/ui/widgets/text.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //criamos o objeto controller
  UserController userController = UserController();

  //variaveis do formulario
  final nomeController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(texto: 'Login'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(
                  hintText: 'Usuário', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'Senha', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
                onPressed: () {
                  userController.login(
                      context, nomeController.text, passwordController.text);
                },
                child: const Text('Login')),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                child: ClicavelTextHome(text: 'Nao possui uma conta?'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
