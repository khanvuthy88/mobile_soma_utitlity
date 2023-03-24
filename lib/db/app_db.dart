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
  Future<void> zoneBatchInsert(List<ZoneModelCompanion> zoneData) async {
    await batch((batch){
      batch.insertAll(zoneModel, zoneData);
    });
  }
  Future<int> newZone(ZoneModelCompanion zone) async {
    return await into(zoneModel).insert(zone);
  }
  Future<int> removeZone(int id) async {
    return await (delete(zoneModel)..where((tbl) => tbl.id.equals(id))).go();
  }
  Future<int> emptyZones() async {
    return await (delete(zoneModel)).go();
  }
  Stream<List<ZoneModelData>> getZonesStream() {
    return select(zoneModel).watch();
  }

  Future<List<CustomerModelData>> getCustomers() async {
    return await (select(customerModel)..orderBy([(t) => OrderingTerm(expression: t.locationCode)])).get();
  }
  Future<List<CustomerModelData>> getCustomerByZone(String zoneId) async {
    return await (select(customerModel)..where((tbl) => tbl.zone.equals(zoneId) & tbl.newConsumption.equals(0))).get();
  }
  Stream<List<CustomerModelData>> getCustomerByZoneDoneRead(String zoneName) {
    return (select(customerModel)..where((tbl) => tbl.zone.equals(zoneName) & tbl.newConsumption.isNotValue(0))).watch();
  }
  Stream<List<CustomerModelData>> getCustomerSteamByZone(String zoneName){
    return (select(customerModel)..where((tbl) => tbl.zone.equals(zoneName) & tbl.newConsumption.equals(0))).watch();
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
  Future<void> customerBatchInsert(List<CustomerModelCompanion> customerData) async {
    await batch((batch){
      batch.insertAll(customerModel, customerData);
    });
  }
  Future<int> newCustomer(CustomerModelCompanion customer) async {
    return await into(customerModel).insert(customer);
  }
  Future<int> removeCustomer(int id) async {
    return await (delete(customerModel)..where((tbl) => tbl.id.equals(id))).go();
  }
  Future<int> emptyCustomer() async {
    return await (delete(customerModel)).go();
  }

}