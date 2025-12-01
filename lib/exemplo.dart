import 'package:flutter/material.dart';

class PerfilComCamera extends StatelessWidget {
  const PerfilComCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        // clipBehavior: Clip.none, // Descomente se quiser que o botão saia ainda mais para fora
        children: [
          // 1. A FOTO DE PERFIL
          Container(
            width: 120, // Tamanho da foto
            height: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                // Substitua pelo caminho da sua imagem
                image: AssetImage('assets/imags/foto_perfil.png'), 
              ),
            ),
          ),

          // 2. O BOTÃO DA CÂMERA (Topo Direito)
          Positioned(
            top: 0,   // Cola no topo
            right: 0, // Cola na direita
            child: Container(
              width: 40, // Tamanho da bolinha branca
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white, // Fundo branco
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue.shade200, // Borda azulada fina
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: IconButton(
                padding: EdgeInsets.zero, // Remove padding interno para centralizar
                icon: const Icon(
                  Icons.camera_alt_outlined, // Ícone de câmera vazado
                  color: Colors.blue,        // Ícone azul
                  size: 20,
                ),
                onPressed: () {
                  print("Clicou na câmera");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}