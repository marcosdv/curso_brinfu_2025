import 'package:flutter/material.dart';

class ProdutosView extends StatefulWidget {
  const ProdutosView({super.key});

  @override
  State<ProdutosView> createState() => _ProdutosViewState();
}

class _ProdutosViewState extends State<ProdutosView> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(title: Text('Produtos')),
        backgroundColor: Colors.black26,
      ),
    );
  }
}
