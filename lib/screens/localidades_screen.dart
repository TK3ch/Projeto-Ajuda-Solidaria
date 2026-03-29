import 'package:flutter/material.dart';
import '../app_state.dart';
import '../models/localidade.dart';

class LocalidadesScreen extends StatelessWidget {
  const LocalidadesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppStateProvider.of(context);

    final localidades = [...appState.localidades];


    localidades.sort((a, b) => b.quantidadePedidos.compareTo(a.quantidadePedidos));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Localidades'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: localidades.length,
        itemBuilder: (context, index) {
          final loc = localidades[index];
          return _LocalidadeCard(localidade: loc);
        },
      ),
    );
  }
}

class _LocalidadeCard extends StatelessWidget {
  final Localidade localidade;

  const _LocalidadeCard({required this.localidade});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              localidade.imagemUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🏷 Nome
                Text(
                  localidade.nome,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  '📍 ${localidade.regiao}',
                  style: const TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(Icons.whatshot, color: Colors.red),
                    const SizedBox(width: 6),
                    Text(
                      '${localidade.quantidadePedidos} pedidos na região',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}