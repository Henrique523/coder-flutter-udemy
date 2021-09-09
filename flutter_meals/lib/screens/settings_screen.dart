import 'package:flutter/material.dart';

import '../models/settings.dart';
import '../components/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;

  const SettingsScreen({
    required this.onSettingsChanged,
    required this.settings,
  });

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings = Settings();

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    void Function(bool) onChanged,
    Settings settings,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configuraçes',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem glúten',
                  'Só Exibe refeições sem glúten',
                  settings.isGlutenFree,
                  (value) {
                    setState(() {
                      settings.isGlutenFree = value;
                    });
                  },
                  settings,
                ),
                _createSwitch(
                  'Sem lactose',
                  'Só Exibe refeições sem lactose',
                  settings.isLactoseFree,
                  (value) {
                    setState(() {
                      settings.isLactoseFree = value;
                    });
                  },
                  settings,
                ),
                _createSwitch(
                  'Vegano',
                  'Só Exibe refeições veganas',
                  settings.isVegan,
                  (value) {
                    setState(() {
                      settings.isVegan = value;
                    });
                  },
                  settings,
                ),
                _createSwitch(
                  'Vegetariana',
                  'Só Exibe refeições vegetarianas',
                  settings.isVegetarian,
                  (value) {
                    setState(() {
                      settings.isVegetarian = value;
                    });
                  },
                  settings,
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
