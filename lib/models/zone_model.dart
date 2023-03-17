import 'package:drift/drift.dart';

class ZoneModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get odooId => integer().named('odoo_id')();
}

