
import 'package:drift/drift.dart';

class CustomerModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get khmerName => text().named("khmer_name").nullable()();
  IntColumn get locationId => integer().named('location_id').nullable()();
  TextColumn get zoneName => text().named('zone_name').nullable()();
  IntColumn get zoneId => integer().named('zone_id').nullable()();
  IntColumn get newConsumption => integer().named('new_consumption').nullable()();
  IntColumn get prevConsumption => integer().named('prev_consumption').nullable()();
  IntColumn get totalConsumption => integer().named('total_consumption').nullable()();
}