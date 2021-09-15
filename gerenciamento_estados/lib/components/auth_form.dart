import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gerenciamento_estados/exceptions/auth_exception.dart';
import 'package:gerenciamento_estados/providers/auth.dart';
import 'package:provider/provider.dart';

enum AuthMode {
  Signup,
  Login,
}

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  bool _isLogin() => _authMode == AuthMode.Login;
  bool _isSignup() => _authMode == AuthMode.Signup;

  final _passwordController = TextEditingController();

  final matchedValidator = MatchValidator(errorText: 'Senhas não coincidem.');

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Campo é obrigatório'),
    MinLengthValidator(5, errorText: 'Senha deve ter mais de 5 caracteres'),
  ]);

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Campo é obrigatório'),
    EmailValidator(errorText: 'Campo precisa ser um e-mail'),
  ]);

  _showErrorDialog(String msg) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Ocorreu um erro!'),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    setState(() => _isLoading = true);

    _formKey.currentState?.save();
    Auth auth = Provider.of(context, listen: false);

    try {
      if (_isLogin()) {
        await auth.login(_authData['email']!, _authData['password']!);
      } else {
        await auth.signup(_authData['email']!, _authData['password']!);
      }
    } on AuthException catch (error) {
      _showErrorDialog(error.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      height: _isLogin() ? 310 : 400,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          height: _isLogin() ? 310 : 400,
          width: deviceSize.width * 0.75,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      gapPadding: 2,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (email) => _authData['email'] = email ?? '',
                  validator: emailValidator,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      gapPadding: 2,
                    ),
                  ),
                  obscureText: true,
                  validator: passwordValidator,
                  textInputAction:
                      _isSignup() ? TextInputAction.next : TextInputAction.done,
                  onSaved: (password) => _authData['password'] = password ?? '',
                  controller: _passwordController,
                ),
                if (_isSignup()) const SizedBox(height: 8),
                if (_isSignup())
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirmar Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        gapPadding: 2,
                      ),
                    ),
                    obscureText: true,
                    validator: _isLogin()
                        ? null
                        : (passwordConfirmation) =>
                            matchedValidator.validateMatch(
                              passwordConfirmation!,
                              _passwordController.text,
                            ),
                    textInputAction: TextInputAction.done,
                  ),
                const SizedBox(height: 8),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text(
                      _isLogin() ? 'ENTRAR' : 'REGISTRAR',
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 8,
                      ),
                    ),
                  ),
                Spacer(),
                FittedBox(
                  fit: BoxFit.cover,
                  child: TextButton(
                    onPressed: () {
                      setState(() => _authMode =
                          _isLogin() ? AuthMode.Signup : AuthMode.Login);
                    },
                    child: _isLogin()
                        ? const Text('DESEJA REGISTRAR?')
                        : const Text('JÁ POSSUI CONTA?'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
