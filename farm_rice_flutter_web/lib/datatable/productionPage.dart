
import 'package:flutter/material.dart';

class ProductionPage extends StatefulWidget {
  const ProductionPage({Key key}) : super(key: key);

  @override
  State<ProductionPage> createState() => _ProductionPageState();
}

class _ProductionPageState extends State<ProductionPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produccion"),
        backgroundColor: const Color(0xff329437),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/fondo_de_pantalla.jpg'),
              fit: BoxFit.fill),
        ),
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}