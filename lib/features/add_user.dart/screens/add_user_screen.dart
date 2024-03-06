import 'package:crud_flutter/features/features.dart';
import 'package:flutter/material.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          const CustomTitleWidget(title: 'Agregar nuevo Usuario'),
          const SizedBox(height: 32),
          const TitleFieldWidget(title: 'Nombre:'),
          const SizedBox(height: 16),
          const TitleFieldWidget(title: 'Apellido:'),
          const SizedBox(height: 16),
          const TitleFieldWidget(
            title: 'Teléfono:',
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          const TitleFieldWidget(
            title: 'Dirección:',
            keyboardType: TextInputType.streetAddress,
          ),
          const SizedBox(height: 16),
          const TitleFieldWidget(
            title: 'Correo:',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          const TitleFieldWidget(
            title: 'Fecha de Nacimiento:',
            hintText: '[dd/mm/yy]',
          ),
          const SizedBox(height: 16),
          const TitleFieldWidget(
            title: 'Contraseña:',
            keyboardType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Guardar'),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
