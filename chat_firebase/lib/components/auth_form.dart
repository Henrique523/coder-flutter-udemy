import 'dart:io';

import 'package:chat_firebase/components/user_image_picker.dart';
import 'package:chat_firebase/models/auth_form_data.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;
  AuthForm({
    required this.onSubmit,
  });

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _handleImagePick(File image) {
    _formData.image = image;
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Theme.of(context).errorColor,
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    if (_formData.image == null && _formData.isSignUp) {
      return _showError('Imagem não selecionada!');
    }

    widget.onSubmit(_formData);
  }

  final nameValidation = MultiValidator([
    RequiredValidator(errorText: 'Este campo é obrigatório'),
    MinLengthValidator(3, errorText: 'Insira ao menos 3 caracteres no nome'),
  ]);

  final emailValidation = MultiValidator([
    RequiredValidator(errorText: 'Este campo é obrigatório'),
    EmailValidator(errorText: 'Insira um email válido'),
  ]);

  final passwordValidation = MultiValidator([
    RequiredValidator(errorText: 'Este campo é obrigatório'),
    MinLengthValidator(6, errorText: 'Insira ao menos 6 caracteres na senha'),
  ]);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_formData.isSignUp)
                UserImagePicker(onImagePick: _handleImagePick),
              if (_formData.isSignUp)
                TextFormField(
                  key: ValueKey('name'),
                  initialValue: _formData.name,
                  onChanged: (name) => _formData.name = name,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),
                  validator: nameValidation,
                  textInputAction: TextInputAction.next,
                ),
              TextFormField(
                key: ValueKey('email'),
                initialValue: _formData.email,
                onChanged: (email) => _formData.email = email,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
                validator: emailValidation,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                key: ValueKey('password'),
                obscureText: true,
                initialValue: _formData.password,
                onChanged: (password) => _formData.password = password,
                decoration: InputDecoration(
                  labelText: 'Senha',
                ),
                validator: passwordValidation,
                textInputAction: TextInputAction.done,
                onEditingComplete: _submit,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: _formData.isLogin
                    ? const Text('Entrar')
                    : const Text('Registrar'),
              ),
              TextButton(
                child: _formData.isLogin
                    ? const Text('Criar uma nova conta?')
                    : const Text('Já possui uma conta?'),
                onPressed: () {
                  setState(() {
                    _formData.toggleAuthMode();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
