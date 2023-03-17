import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../models/customer_model.dart';
import '../models/zone_model.dart';

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'smg_utility.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables:[ZoneModel, CustomerModel])
class AppDb extends _$AppDb {
  AppDb(): super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<ZoneModelData>> getZones() async {
    return await select(zoneModel).get();
  }
  Future<ZoneModelData> getZone(int id) async {
    return await (select(zoneModel)..where((tbl) => tbl.id.equals(id))).getSingle();
  }
  Future<bool> updateZone(ZoneModelCompanion zone) async {
    return await update(zoneModel).replace(zone);
  }
  Future<int> newZone(ZoneModelCompanion zone) async {
    return await into(zoneModel).insert(zone);
  }
  Future<int> removeZone(int id) async {
    return await (delete(zoneModel)..where((tbl) => tbl.id.equals(id))).go();
  }
  Stream<List<ZoneModelData>> getZonesStream() {
    return select(zoneModel).watch();
  }

  Future<List<CustomerModelData>> getCustomers() async {
    return await select(customerModel).get();
  }
  Stream<List<CustomerModelData>> getCustomersStream() {
    return select(customerModel).watch();
  }
  Future<CustomerModelData> getCustomer(int id) async {
    return await (select(customerModel)..where((tbl) => tbl.id.equals(id))).getSingle();
  }
  Future<bool> updateCustomer(CustomerModelCompanion customer) async {
    return await update(customerModel).replace(customer);
  }
  Future<int> newCustomer(CustomerModelCompanion customer) async {
    return await into(customerModel).insert(customer);
  }
  Future<int> removeCustomer(int id) async {
    return await (delete(customerModel)..where((tbl) => tbl.id.equals(id))).go();
  }

}