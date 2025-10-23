import 'package:flutter/material.dart';

class PantallaCamposPersonales extends StatefulWidget {
  const PantallaCamposPersonales({super.key});

  @override
  State<PantallaCamposPersonales> createState() => _PantallaCamposPersonalesState();
}

class _PantallaCamposPersonalesState extends State<PantallaCamposPersonales> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidosController = TextEditingController();
  final TextEditingController edadController = TextEditingController();
  final TextEditingController gradoController = TextEditingController();

  String? genero;

  @override
  void dispose() {
    nombreController.dispose();
    apellidosController.dispose();
    edadController.dispose();
    gradoController.dispose();
    super.dispose();
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
        title: const Text('Complete su perfil', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F6FB),
                      borderRadius: BorderRadius.circular(48),
                      border: Border.all(color: const Color(0xFFE5EAF1)),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt_outlined, size: 32, color: Colors.black54),
                      onPressed: () {
                        // TODO: implement image picker
                      },
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text('Añadir foto de perfil', style: TextStyle(color: Colors.black54)),
                  const SizedBox(height: 18),

                  TextField(
                    controller: nombreController,
                    decoration: InputDecoration(
                      hintText: 'Nombre',
                      border: const UnderlineInputBorder(),
                      prefixIcon: const Icon(Icons.person_outline),
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    controller: apellidosController,
                    decoration: const InputDecoration(
                      hintText: 'Apellidos',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 4),
                  InputDecorator(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      prefixIcon: Icon(Icons.transgender_outlined),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: const Text('Seleccione Género'),
                        value: genero,
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(value: 'Femenino', child: Text('Femenino')),
                          DropdownMenuItem(value: 'Masculino', child: Text('Masculino')),
                          DropdownMenuItem(value: 'No binario', child: Text('No binario')),
                          DropdownMenuItem(value: 'Prefiero no decir', child: Text('Prefiero no decir')),
                        ],
                        onChanged: (v) => setState(() => genero = v),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    controller: edadController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Edad',
                      border: UnderlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today_outlined),
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    controller: gradoController,
                    decoration: const InputDecoration(
                      hintText: 'Grado',
                      border: UnderlineInputBorder(),
                      prefixIcon: Icon(Icons.school_outlined),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // For now just finish the flow
                        Navigator.popUntil(context, ModalRoute.withName('/'));
                      },
                      child: const Text('Guardar y continuar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
