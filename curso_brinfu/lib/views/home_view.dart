import 'package:curso_brinfu/views/produtos_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  bool _isSelecionado = false;
  Color _corCaixa = Colors.blue.shade800;

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Curso BRINFU'),
          backgroundColor: Colors.blue.shade300,
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){}),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              margin: EdgeInsets.all(20),
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              height: _isSelecionado ? 250 : 150,
              width: _isSelecionado ? 250 : 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    _isSelecionado ? Colors.yellow : Colors.blue.shade800,
                    _isSelecionado ? Colors.green : Colors.blue.shade200,
                  ]
                ),
                boxShadow: [
                  BoxShadow(color: Colors.black, blurRadius: 10),
                ],
                borderRadius: BorderRadius.all(
                    Radius.circular(_isSelecionado ? 150 : 20)
                ),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _isSelecionado = !_isSelecionado;
                  });
                },
                child: Text('Clique aqui para animar', style: TextStyle(
                  color: Colors.black, fontSize: 20
                )),
              ),
            ),
            ElevatedButton(
              onPressed: _abrirProdutos,
              child: Text('Produtos')
            )
          ],
        ),
      ),
    );
  }

  void _abrirProdutos() {
    Navigator.push(context, PageRouteBuilder(
      pageBuilder: (context, animation, secAnimation) => ProdutosView(),
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (context, animation, secAnimation, child) {
        //return _criarEfeitoZoom(animation, child);
        //return _criarEfeitoFadeIn(animation, child);
        return _criarEfeitoSlide(animation, child);
      }
    ));
  }

  Widget _criarEfeitoSlide(animation, child) {
    var tween = Tween<Offset>(
      //begin: Offset(0.0, 1.0), //Vertical
      begin: Offset(1.0, 0.0), //Horizontal
      end: Offset.zero
    ).chain(CurveTween(curve: Curves.ease));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }

  Widget _criarEfeitoFadeIn(animation, child) {
    var tween = Tween<double>(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Curves.ease));

    return FadeTransition(
      opacity: animation.drive(tween),
      child: child,
    );
  }

  Widget _criarEfeitoZoom(animation, child) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.bounceIn
        ),
      ),
      child: child,
    );
  }
}