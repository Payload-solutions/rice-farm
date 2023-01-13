import 'package:farm_rice_flutter_web/vistas/communityPage.dart';
import 'package:farm_rice_flutter_web/vistas/homepage.dart';
import 'package:farm_rice_flutter_web/vistas/inventoryPage.dart';
import 'package:farm_rice_flutter_web/vistas/lotsPage.dart';
import 'package:farm_rice_flutter_web/vistas/productionPage.dart';
import 'package:farm_rice_flutter_web/vistas/reportPage.dart';
import 'package:farm_rice_flutter_web/vistas/userPage.dart';
import 'package:farm_rice_flutter_web/vistas/workedPage.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget{
  const ListWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(0),
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.account_circle, size: 80),
                SizedBox(height: 15),
                Text("Arturo Negreiros", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("Administrador", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                Text("__________________________", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                SizedBox(height: 20),
              ],
            ),
          ),
          ListTile(
            title: const Text("Inicio"),
            leading: const Icon(Icons.home, size: 25),
            onTap: (){
              Navigator.pop(context, (ctx)=>const HomePage());
            },
          ),
          ListTile(
            title: const Text("Usuarios"),
            leading: const Icon(Icons.account_circle, size: 25),
            onTap: (){
              Navigator.pop(context, (ctx)=>const UserPage());
            },
          ),
          ListTile(
            title: const Text("Trabajadores"),
            leading: const Icon(Icons.work, size: 25),
            onTap: (){
              Navigator.pop(context, (ctx)=>const WorkedPage());
            },
          ),
          ListTile(
            title: const Text("Inventario"),
            leading: const Icon(Icons.inventory, size: 25),
            onTap: (){
              Navigator.pop(context, (ctx)=>const InventoryPage());
            },
          ),
          ListTile(
            title: const Text("Reportes"),
            leading: const Icon(Icons.info_sharp, size: 25),
            onTap: (){
              Navigator.pop(context, (ctx)=>const ReportPage());
            },
          ),
          ListTile(
            title: const Text("Lotes"),
            leading: const Icon(Icons.warehouse, size: 25),
            onTap: (){
              Navigator.pop(context, (ctx)=>const LotsPage());
            },
          ),
          ListTile(
            title: const Text("Labores"),
            leading: const Icon(Icons.engineering, size: 25),
            onTap: (){
              Navigator.pop(context, (ctx)=>const CommunityPage());
            },
          ),
          ListTile(
            title: const Text("Produccion"),
            leading: const Icon(Icons.production_quantity_limits_outlined, size: 25),
            onTap: (){
              Navigator.pop(context, (ctx)=>const ProductionPage());
            },
          ),
        ]
    );
  }
}