import 'package:flutter/material.dart';

class TelaAcess extends StatelessWidget {
  const TelaAcess({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: PageStorageKey('aba_acesso'),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dados de Acesso',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        height: 0,
                        fontSize: 18,
                      ),
                    ),

                    SizedBox(height: 30),

                    _buildcampoTexto('E-mail'),
                    _buildcampoTexto('Senha'),
                    _buildcampoTexto('Confirmar Senha'),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.symmetric(
                        vertical: 28,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0XFFE5F7FF),
                        border: Border.all(
                          width: 1,
                          color: const Color(0XFFC0E6F8),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Ao alterar sua senha você será desconectado e precisará logar novamente.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 55, 78, 108),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildcampoTexto(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          decoration: InputDecoration(
            hintText: label,
            //labelText: label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ],
    );
  }
}
