
import 'package:farm_rice_web_flutter/class/classUserTable.dart';
import 'package:flutter/material.dart';

typedef OnRowSelect = void Function(int index);

class UserDataTableSource extends DataTableSource {
  UserDataTableSource({
    @required List<UserTable> userData,
    @required this.onRowSelect,
  })  : _userData = userData,
        assert(userData != null);

  final List<UserTable> _userData;
  final OnRowSelect onRowSelect;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);

    if (index >= _userData.length) {
      return null;
    }
    final _user = _userData[index];

    return DataRow.byIndex(
      index: index, // DONT MISS THIS
      cells: <DataCell>[
        DataCell(Text('${_user.userID}')),
        DataCell(Text(_user.dni)),
        DataCell(Text(_user.name)),
        DataCell(Text(_user.lastname)),
        DataCell(Text(_user.email)),
        DataCell(Text(_user.phone)),
        DataCell(Text(_user.fiscalName)),
        DataCell(Text(_user.direction)),
        DataCell(Text(_user.rolId)),
        DataCell(Text('${_user.status}')),
        DataCell(
          IconButton(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: const Icon(Icons.details),
            onPressed: () => onRowSelect(index),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _userData.length;

  @override
  int get selectedRowCount => 0;

  /*
   *
   * Sorts this list according to the order specified by the [compare] function.

    The [compare] function must act as a [Comparator].

    List<String> numbers = ['two', 'three', 'four'];
// Sort from shortest to longest.
    numbers.sort((a, b) => a.length.compareTo(b.length));
    print(numbers);  // [two, four, three]
    The default List implementations use [Comparable.compare] if [compare] is omitted.

    List<int> nums = [13, 2, -11];
    nums.sort();
    print(nums);  // [-11, 2, 13] 
   */
  void sort<T>(Comparable<T> Function(UserTable d) getField, bool ascending) {
    _userData.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    notifyListeners();
  }
}