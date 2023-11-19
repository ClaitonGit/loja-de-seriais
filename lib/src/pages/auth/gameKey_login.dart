import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gamekey/src/pages/auth/cadastroUser.dart';
import 'package:gamekey/src/pages/auth/components/custom_text_fild.dart';
import 'package:gamekey/src/pages/base/base_screen.dart';


class Gamekey extends StatefulWidget {
  const Gamekey({super.key});

  @override
  State<Gamekey> createState() => _GamekeyState();
}

class _GamekeyState extends State<Gamekey> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              // Parte da logotipo
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 32),
                      child: Image.asset(
                        "images/logo.png",
                        width: 220,
                        height: 220,
                        alignment: Alignment.center,
                      ),
                    ),

                    // Animação
                    SizedBox(
                      height: 30,
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          RotateAnimatedText(
                            'Loja de seriais baratos!',
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Formulario
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),

                // Campos de login
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // email
                    const CustomTextFild(
                      icon: Icons.email,
                      label: 'Email',
                    ),
                    // senha
                    const CustomTextFild(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                    ),

                    //Botão entrar

                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        )),
                        onPressed: () {

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (c){
                                  return BaseScreen();
                          }),);

                        },
                        child: const Text(
                          'Entrar',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),

                    // Esqueceu a senha
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Esqueseu a senha?',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),

                    //Divisor
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade200,
                              thickness: 2,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text('ou'),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade200,
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Botão novo usuario
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          side: BorderSide(
                            width: 2,
                            color: Colors.black54,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (c) {
                              return CadastroUser();
                            }),
                          );
                        },
                        child: const Text(
                          'Criar conta',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
