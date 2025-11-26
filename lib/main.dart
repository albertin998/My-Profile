import 'package:flutter/material.dart';
import 'package:my_profile/tela_acess.dart';
import 'customToggleSwitch.dart';
import 'package:flutter/cupertino.dart';
import 'theme/colors_palette.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.angleLeft,
                            color: ColorsPalette.blue2,
                          ),
                          SizedBox(width: 20),
                          Text(
                            'Meu perfil',
                            style: TextStyle(
                              color: ColorsPalette.navyBlue3,
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                          Spacer(),

                          Text(
                            'Editar',
                            style: TextStyle(
                              color: ColorsPalette.blue2,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Divider(),

                    Center(child: Icon(Icons.account_circle, size: 150)),

                    Text(
                      'Facilita Ola',
                      style: TextStyle(
                        color: ColorsPalette.navyBlue3,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      'Administrador',
                      style: TextStyle(
                        color: ColorsPalette.navyBlue2,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),

                    SizedBox(height: 25),

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
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 25),
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.lightUserCircle,
                                    color: ColorsPalette.blue2,
                                  ),
                                  SizedBox(width: 8),

                                  const Text(
                                    "Dados Pessoais",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildCampoTexto("Nome", 'Nome:'),
                            _buildCampoTexto("CPF", 'CPF:'),
                            _buildCampoTexto("Endereço", 'Endereço:'),
                            _buildCampoTexto("Cidade", 'Cidade:'),
                            _buildCampoTexto("Telefone", 'Telefone:'),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.lightPhoneVolume,
                                    color: ColorsPalette.blue2,
                                  ),

                                  SizedBox(width: 10),
                                  const Text(
                                    "Telefones para contatos",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildCampoTexto("Celular", 'Celular:'),
                            _buildCampoTexto("Telefone", 'Telefone:'),
                            _buildCampoTexto("E-mail", 'E-mail:'),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.lightMapMarkerAlt,
                                    color: ColorsPalette.blue2,
                                  ),

                                  SizedBox(width: 10),

                                  const Text(
                                    "Endereço",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildCampoTexto("CEP", 'CEP:'),
                            _buildCampoTexto("Endereço", 'Endereço:'),
                            _buildCampoTexto("Estado", 'Estado:'),
                            _buildCampoTexto("Cidade", 'Cidade:'),
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

Widget _buildCampoTexto(String label, String titulo) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15.0),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        TextField(
          cursorHeight: 18,
          cursorColor: ColorsPalette.blue1,
          cursorWidth: 2,

          decoration: InputDecoration(
            hintText: label,
            hintStyle: TextStyle(color: ColorsPalette.lightGrey2),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsPalette.lightGrey1, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsPalette.lightGrey1, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    ),
  );
}
