import 'package:flutter/material.dart';
import '../app_state.dart';
import '../routes.dart';

class ContasScreen extends StatelessWidget {
  const ContasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppStateProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Conta'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 👤 PERFIL
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person, size: 30),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appState.nomeUsuario,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          appState.emailUsuario,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 📊 RESUMO
            Row(
              children: [
                Expanded(
                  child: _InfoCard(
                    titulo: 'Pedidos',
                    valor: appState.pedidos.length.toString(),
                    icone: Icons.shopping_cart,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _InfoCard(
                    titulo: 'Ajudas',
                    valor: appState.ofertas.length.toString(),
                    icone: Icons.volunteer_activism,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ⚙️ OPÇÕES
            _MenuItem(
              icon: Icons.settings,
              texto: 'Configurações',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.configuracoes);
              },
            ),

            _MenuItem(
              icon: Icons.location_on,
              texto: 'Localidades',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.localidades);
              },
            ),

            const Divider(),

            _MenuItem(
              icon: Icons.logout,
              texto: 'Sair',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logout (simulado)')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icone;

  const _InfoCard({
    required this.titulo,
    required this.valor,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icone, size: 30),
            const SizedBox(height: 8),
            Text(
              valor,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(titulo),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String texto;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.texto,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(texto),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}