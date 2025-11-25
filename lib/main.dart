import 'package:flutter/material.dart';
import 'package:my_profile/tela_acess.dart';
import 'customToggleSwitch.dart';
import 'package:flutter/cupertino.dart';

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
  int _indiceSelecionado = 0;

  //ntrolador para comandar a troca de páginas
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _mudarpagina(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    setState(() {
      _indiceSelecionado = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.chevron_left_outlined),
                        Text('Meu perfil'),
                      ],
                    ),

                    Divider(),

                    Center(child: Icon(Icons.account_circle, size: 150)),

                    Text('Facilita Ola'),
                    Text('Administrador'),

                    CustomToggleSwitch(
                      SelectedIndex: _indiceSelecionado,
                      onToggle: (index) => _mudarpagina(index),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: PageView(
            controller: _pageController,

            onPageChanged: (index) {
              setState(() {
                _indiceSelecionado = index;
              });
            },
            children: [
              Builder(
                builder: (context) {
                  return CustomScrollView(
                    key: const PageStorageKey('aba_perfil'),
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.all(20),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate([
                            const Text(
                              "Dados Pessoais",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildCampoTexto("Nome"),
                            _buildCampoTexto("CPF"),
                            _buildCampoTexto("Endereço"),
                            _buildCampoTexto("Cidade"),
                            _buildCampoTexto("Telefone"),
                            const Text(
                              "Dados Pessoais",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildCampoTexto("Nome"),
                            _buildCampoTexto("CPF"),
                            _buildCampoTexto("Endereço"),
                            _buildCampoTexto("Cidade"),
                            _buildCampoTexto("Telefone"),
                          ]),
                        ),
                      ),
                    ],
                  );
                },
              ),

              TelaAcess(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildCampoTexto(String label) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15.0),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle()),
        TextField(
          decoration: InputDecoration(
            hintText: label,
            labelText: label,

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ],
    ),
  );
}
