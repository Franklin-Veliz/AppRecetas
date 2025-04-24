import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final userController = TextEditingController();
  final passwordController = TextEditingController();

  //llave para el form
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Image.asset(
                      './assets/logos/logo.jpg',
                      height: 150,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: userController,
                    validator: (String? valor) {
                      if (valor!.isEmpty) {
                        return 'El usuario es obligatorio';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Usuario',
                      icon: Icon(Icons.person),
                      disabledBorder: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    validator: (String? valor) {
                      if (valor!.isEmpty) {
                        return 'El password es obligatorio';
                      }

                      if (valor.length < 6) {
                        return 'El password debe tener al menos 6 caracteres';
                      }

                      if (!valor.contains('@')) {
                        return 'El password debe contener un @';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon:
                          true ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
                      labelText: 'Pasword',
                      disabledBorder: OutlineInputBorder(),
                      icon: Icon(Icons.lock),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // formkey.currentState!.validate();

                        if (userController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            action: SnackBarAction(
                              label: 'Cerrar',
                              onPressed: () {},
                            ),
                            content: Column(
                              children: [
                                Text('Titulo'),
                                Text('El usuario es obligatorio'),
                              ],
                            ),
                          ));

                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('Aviso!'),
                                    content: Text('El usuario es obligatorio'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          context.go('/productos');
                                        },
                                        child: Text('Aceptar'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: Text('Cancelar'),
                                      ),
                                    ],
                                  ));
                          return;
                        }
                        print(userController.text);
                        print(passwordController.text);
                      },
                      child: Text('Inicar Sesión'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension on BuildContext {
  void pop() {}

  void go(String s) {}
}
