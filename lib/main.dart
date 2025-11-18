import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.chevron_left_outlined),
                    Text('Meu perfil'),
                  ],
                ),
              ),

              Divider(),

              Center(child: Icon(Icons.account_circle, size: 150)),

              Text('Facilita Ola'),
              Text('Administrador'),

              ToggleButtons(
                isSelected: [selectedIndex == 0, selectedIndex == 1],
                onPressed: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                borderRadius: BorderRadius.circular(30),
                selectedColor: Colors.blue, // Texto selecionado
                fillColor: Colors.white, // Fundo selecionado
                color: Colors.grey, // Texto não selecionado
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text('Perfil'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text('Acesso'),
                  ),
                ],
              ),

              Row(children: [Text('Dados pessoais')]),
            ],
          ),
        ),
      ),
    );
  }
}
