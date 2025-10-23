import 'package:flutter/material.dart';

class PantallaRegistro extends StatefulWidget {
  const PantallaRegistro({super.key});

  @override
  State<PantallaRegistro> createState() => _PantallaRegistroState();
}

class _PantallaRegistroState extends State<PantallaRegistro> {
  final TextEditingController nombreUsuarioController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final TextEditingController repetirContrasenaController = TextEditingController();
  bool obscure1 = true;
  bool obscure2 = true;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nombreUsuarioController.dispose();
    emailController.dispose();
    contrasenaController.dispose();
    repetirContrasenaController.dispose();
    super.dispose();
  }

  String? _emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email requerido';
    final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!regex.hasMatch(value)) return 'Email no válido';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black54),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/logo.png', width: 62, height: 62),
                        const SizedBox(width: 12),
                        const Text('Match\nRoom',
                            style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF2A5DA8),
                                height: 1.0)),
                      ],
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: nombreUsuarioController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_outline),
                        hintText: 'Nombre de Usuario',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      ),
                      validator: (v) => v == null || v.trim().isEmpty ? 'Nombre de usuario requerido' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        hintText: 'Email/Correo electrónico',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      ),
                      validator: _emailValidator,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: contrasenaController,
                      obscureText: obscure1,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        hintText: 'Contraseña',
                        suffixIcon: IconButton(
                          icon: Icon(obscure1 ? Icons.visibility : Icons.visibility_off),
                          onPressed: () => setState(() => obscure1 = !obscure1),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      ),
                      validator: (v) => v != null && v.length >= 6 ? null : 'Al menos 6 caracteres',
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: repetirContrasenaController,
                      obscureText: obscure2,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        hintText: 'Repetir contraseña',
                        suffixIcon: IconButton(
                          icon: Icon(obscure2 ? Icons.visibility : Icons.visibility_off),
                          onPressed: () => setState(() => obscure2 = !obscure2),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      ),
                      validator: (v) => v == contrasenaController.text ? null : 'No coincide',
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, '/personal');
                          }
                        },
                        child: const Text('Crear cuenta'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
