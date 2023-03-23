
import 'package:drift/drift.dart';

class CustomerModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('name')();
  TextColumn get meter => text().named("meter_id").nullable()();
  TextColumn get station => text().named('station')();
  TextColumn get village => text().named('village')();
  IntColumn get odooID => integer().named("odoo_id").nullable()();
  IntColumn get odooZoneId => integer().named('odoo_zone_id')();
  TextColumn get zone => text().named('zone')();
  TextColumn get locationCode => text().named('location_code').nullable()();
  IntColumn get previousConsumption => integer().named("previous_consumption").nullable()();
  IntColumn get newConsumption => integer().named("new_consumption").nullable()();
  IntColumn get usageConsumption => integer().named("usage_consumption").nullable()();
}