import 'package:flutter/material.dart';
import 'package:gamekey/src/pages/auth/components/custom_text_fild.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroUser extends StatefulWidget {
  CadastroUser({super.key});
  @override
  State<CadastroUser> createState() => _CadastoUserState();
}

final cpfFormatter = MaskTextInputFormatter(
  mask: '###.###.###-##',
  filter: {'#': RegExp(r'[0-9]'),
  },
);


final phoneFormatter = MaskTextInputFormatter(
  mask: '## # ####-####',
  filter: {'#': RegExp(r'[0-9]'),
  },
);

class _CadastoUserState extends State<CadastroUser> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomTextFild(
                          icon: Icons.email,
                          label: 'Email',
                        ),
                        const CustomTextFild(
                          icon: Icons.lock,
                          label: 'Senha',
                          isSecret: true,
                        ),
                        const CustomTextFild(
                          icon: Icons.person,
                          label: 'Nome',
                        ),
                       CustomTextFild(
                          icon: Icons.phone,
                          label: 'Celular',
                          inputFormatters: [phoneFormatter],
                        ),
                        CustomTextFild(
                          icon: Icons.file_copy,
                          label: 'CPF',
                          inputFormatters: [cpfFormatter],
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            )),
                            onPressed: () {},
                            child: const Text(
                              'Cadastrar usuário',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
