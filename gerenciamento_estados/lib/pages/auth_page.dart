import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gerenciamento_estados/components/auth_form.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Color.fromRGBO(215, 117, 255, 0.5),
                  Color.fromRGBO(255, 188, 117, 0.9),
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.18),
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (ctx, index) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 40,
                    ),
                    transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepOrange.shade900,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.black26,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      'Minha Loja',
                      style: TextStyle(
                          fontSize: 45,
                          fontFamily: 'Anton',
                          color:
                              Theme.of(context).accentTextTheme.headline6?.color),
                    ),
                  ),
                  AuthForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
