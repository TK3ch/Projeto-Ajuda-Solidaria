import 'package:flutter/widgets.dart';
import 'models/pedido.dart';
import 'models/oferta_ajuda.dart';
import 'models/localidade.dart';

class AppState extends ChangeNotifier {
  final List<Pedido> pedidos = [];
  final List<OfertaAjuda> ofertas = [];

  String nomeUsuario = 'Usuário';
  String emailUsuario = 'usuario@email.com';

  final List<Localidade> localidades = [


    Localidade(
      id: '1',
      nome: 'Centro Comunitário Esperança',
      regiao: 'Centro',
      imagemUrl: 'https://images.unsplash.com/photo-1593113630400-ea4288922497',
      quantidadePedidos: 25,
    ),
    Localidade(
      id: '2',
      nome: 'Igreja Solidária Vida Nova',
      regiao: 'Zona Sul',
      imagemUrl: 'https://images.unsplash.com/photo-1600891964599-f61ba0e24092',
      quantidadePedidos: 40,
    ),
    Localidade(
      id: '3',
      nome: 'Projeto Marmita Feliz',
      regiao: 'Zona Leste',
      imagemUrl: 'https://images.unsplash.com/photo-1547592180-85f173990554',
      quantidadePedidos: 15,
    ),
  ];

  void adicionarPedido(Pedido pedido) {
    pedidos.add(pedido);
    notifyListeners();
  }

  void adicionarOferta(OfertaAjuda oferta) {
    ofertas.add(oferta);
    notifyListeners();
  }

  void atualizarStatus(String id, String novoStatus) {
    final idx = pedidos.indexWhere((p) => p.id == id);
    if (idx != -1) {
      pedidos[idx].status = novoStatus;
      notifyListeners();
    }
  }
}

class AppStateProvider extends InheritedNotifier<AppState> {
  const AppStateProvider({
    super.key,
    required AppState state,
    required super.child,
  }) : super(notifier: state);

  static AppState of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<AppStateProvider>();
    assert(provider != null, 'AppStateProvider nao encontrado no contexto');
    return provider!.notifier!;
  }
}