import 'package:flutter/material.dart';
import 'package:login_cadastro/ui/pages/cadastro.dart';
import 'package:login_cadastro/ui/pages/login.dart';

class ClicavelTextHome extends StatelessWidget {
  final String text;

  const ClicavelTextHome({
    super.key,
    required this.text,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => Cadastro())),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}

class ClicavelText extends StatelessWidget {
  final String text;

  const ClicavelText({
    super.key,
    required this.text,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login())),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
