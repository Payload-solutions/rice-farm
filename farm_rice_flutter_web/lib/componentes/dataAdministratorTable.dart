// ignore_for_file: camel_case_types

import 'package:farm_rice_flutter_web/class/administratorClass.dart';
import 'package:flutter/material.dart';

class resouceDataAdmin extends DataTableSource {
  resouceDataAdmin(this._listLec);
  final List<Administrador> _listLec;

  void _sort<T>(Comparable<T> Function(Administrador d) getField, bool ascending){
    _listLec.sort((Administrador a, Administrador b){
      if(!ascending){
        final Administrador c = a;
        a =b; b =c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  final int _selectCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if(index >= _listLec.length) return null;
    final Administrador user = _listLec[index];
    return DataRow.byIndex(
      index: index,
      selected: user.selected,
      cells: <DataCell>[
        DataCell(Center(child: Text(user.userID))),
        DataCell(Center(child: Text(user.dni))),
        DataCell(Center(child: Text(user.name))),
        DataCell(Center(child: Text(user.lastname))),
        DataCell(Center(child: Text(user.phone))),
        DataCell(Center(child: Text(user.email))),
        DataCell(Center(child: Text(user.fiscalName))),
        DataCell(Center(child: Text(user.direction))),
        DataCell(Center(child: Text(user.rolId))),
        DataCell(Center(child: Text(user.status, style: const TextStyle(backgroundColor: Colors.green)))),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _listLec.length;
  @override
  int get selectedRowCount => _selectCount;
}