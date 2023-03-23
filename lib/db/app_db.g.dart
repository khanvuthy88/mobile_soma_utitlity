// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $ZoneModelTable extends ZoneModel
    with TableInfo<$ZoneModelTable, ZoneModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ZoneModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _odooIdMeta = const VerificationMeta('odooId');
  @override
  late final GeneratedColumn<int> odooId = GeneratedColumn<int>(
      'odoo_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, odooId];
  @override
  String get aliasedName => _alias ?? 'zone_model';
  @override
  String get actualTableName => 'zone_model';
  @override
  VerificationContext validateIntegrity(Insertable<ZoneModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('odoo_id')) {
      context.handle(_odooIdMeta,
          odooId.isAcceptableOrUnknown(data['odoo_id']!, _odooIdMeta));
    } else if (isInserting) {
      context.missing(_odooIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ZoneModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ZoneModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      odooId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}odoo_id'])!,
    );
  }

  @override
  $ZoneModelTable createAlias(String alias) {
    return $ZoneModelTable(attachedDatabase, alias);
  }
}

class ZoneModelData extends DataClass implements Insertable<ZoneModelData> {
  final int id;
  final String name;
  final int odooId;
  const ZoneModelData(
      {required this.id, required this.name, required this.odooId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['odoo_id'] = Variable<int>(odooId);
    return map;
  }

  ZoneModelCompanion toCompanion(bool nullToAbsent) {
    return ZoneModelCompanion(
      id: Value(id),
      name: Value(name),
      odooId: Value(odooId),
    );
  }

  factory ZoneModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ZoneModelData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      odooId: serializer.fromJson<int>(json['odooId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'odooId': serializer.toJson<int>(odooId),
    };
  }

  ZoneModelData copyWith({int? id, String? name, int? odooId}) => ZoneModelData(
        id: id ?? this.id,
        name: name ?? this.name,
        odooId: odooId ?? this.odooId,
      );
  @override
  String toString() {
    return (StringBuffer('ZoneModelData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('odooId: $odooId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, odooId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ZoneModelData &&
          other.id == this.id &&
          other.name == this.name &&
          other.odooId == this.odooId);
}

class ZoneModelCompanion extends UpdateCompanion<ZoneModelData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> odooId;
  const ZoneModelCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.odooId = const Value.absent(),
  });
  ZoneModelCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int odooId,
  })  : name = Value(name),
        odooId = Value(odooId);
  static Insertable<ZoneModelData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? odooId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (odooId != null) 'odoo_id': odooId,
    });
  }

  ZoneModelCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? odooId}) {
    return ZoneModelCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      odooId: odooId ?? this.odooId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (odooId.present) {
      map['odoo_id'] = Variable<int>(odooId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ZoneModelCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('odooId: $odooId')
          ..write(')'))
        .toString();
  }
}

class $CustomerModelTable extends CustomerModel
    with TableInfo<$CustomerModelTable, CustomerModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomerModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _meterMeta = const VerificationMeta('meter');
  @override
  late final GeneratedColumn<String> meter = GeneratedColumn<String>(
      'meter_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _stationMeta =
      const VerificationMeta('station');
  @override
  late final GeneratedColumn<String> station = GeneratedColumn<String>(
      'station', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _villageMeta =
      const VerificationMeta('village');
  @override
  late final GeneratedColumn<String> village = GeneratedColumn<String>(
      'village', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _odooIDMeta = const VerificationMeta('odooID');
  @override
  late final GeneratedColumn<int> odooID = GeneratedColumn<int>(
      'odoo_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _odooZoneIdMeta =
      const VerificationMeta('odooZoneId');
  @override
  late final GeneratedColumn<int> odooZoneId = GeneratedColumn<int>(
      'odoo_zone_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _zoneMeta = const VerificationMeta('zone');
  @override
  late final GeneratedColumn<String> zone = GeneratedColumn<String>(
      'zone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationCodeMeta =
      const VerificationMeta('locationCode');
  @override
  late final GeneratedColumn<String> locationCode = GeneratedColumn<String>(
      'location_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _previousConsumptionMeta =
      const VerificationMeta('previousConsumption');
  @override
  late final GeneratedColumn<int> previousConsumption = GeneratedColumn<int>(
      'previous_consumption', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _newConsumptionMeta =
      const VerificationMeta('newConsumption');
  @override
  late final GeneratedColumn<int> newConsumption = GeneratedColumn<int>(
      'new_consumption', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _usageConsumptionMeta =
      const VerificationMeta('usageConsumption');
  @override
  late final GeneratedColumn<int> usageConsumption = GeneratedColumn<int>(
      'usage_consumption', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        meter,
        station,
        village,
        odooID,
        odooZoneId,
        zone,
        locationCode,
        previousConsumption,
        newConsumption,
        usageConsumption
      ];
  @override
  String get aliasedName => _alias ?? 'customer_model';
  @override
  String get actualTableName => 'customer_model';
  @override
  VerificationContext validateIntegrity(Insertable<CustomerModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('meter_id')) {
      context.handle(_meterMeta,
          meter.isAcceptableOrUnknown(data['meter_id']!, _meterMeta));
    }
    if (data.containsKey('station')) {
      context.handle(_stationMeta,
          station.isAcceptableOrUnknown(data['station']!, _stationMeta));
    } else if (isInserting) {
      context.missing(_stationMeta);
    }
    if (data.containsKey('village')) {
      context.handle(_villageMeta,
          village.isAcceptableOrUnknown(data['village']!, _villageMeta));
    } else if (isInserting) {
      context.missing(_villageMeta);
    }
    if (data.containsKey('odoo_id')) {
      context.handle(_odooIDMeta,
          odooID.isAcceptableOrUnknown(data['odoo_id']!, _odooIDMeta));
    }
    if (data.containsKey('odoo_zone_id')) {
      context.handle(
          _odooZoneIdMeta,
          odooZoneId.isAcceptableOrUnknown(
              data['odoo_zone_id']!, _odooZoneIdMeta));
    } else if (isInserting) {
      context.missing(_odooZoneIdMeta);
    }
    if (data.containsKey('zone')) {
      context.handle(
          _zoneMeta, zone.isAcceptableOrUnknown(data['zone']!, _zoneMeta));
    } else if (isInserting) {
      context.missing(_zoneMeta);
    }
    if (data.containsKey('location_code')) {
      context.handle(
          _locationCodeMeta,
          locationCode.isAcceptableOrUnknown(
              data['location_code']!, _locationCodeMeta));
    }
    if (data.containsKey('previous_consumption')) {
      context.handle(
          _previousConsumptionMeta,
          previousConsumption.isAcceptableOrUnknown(
              data['previous_consumption']!, _previousConsumptionMeta));
    }
    if (data.containsKey('new_consumption')) {
      context.handle(
          _newConsumptionMeta,
          newConsumption.isAcceptableOrUnknown(
              data['new_consumption']!, _newConsumptionMeta));
    }
    if (data.containsKey('usage_consumption')) {
      context.handle(
          _usageConsumptionMeta,
          usageConsumption.isAcceptableOrUnknown(
              data['usage_consumption']!, _usageConsumptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      meter: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meter_id']),
      station: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}station'])!,
      village: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}village'])!,
      odooID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}odoo_id']),
      odooZoneId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}odoo_zone_id'])!,
      zone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}zone'])!,
      locationCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_code']),
      previousConsumption: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}previous_consumption']),
      newConsumption: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}new_consumption']),
      usageConsumption: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}usage_consumption']),
    );
  }

  @override
  $CustomerModelTable createAlias(String alias) {
    return $CustomerModelTable(attachedDatabase, alias);
  }
}

class CustomerModelData extends DataClass
    implements Insertable<CustomerModelData> {
  final int id;
  final String name;
  final String? meter;
  final String station;
  final String village;
  final int? odooID;
  final int odooZoneId;
  final String zone;
  final String? locationCode;
  final int? previousConsumption;
  final int? newConsumption;
  final int? usageConsumption;
  const CustomerModelData(
      {required this.id,
      required this.name,
      this.meter,
      required this.station,
      required this.village,
      this.odooID,
      required this.odooZoneId,
      required this.zone,
      this.locationCode,
      this.previousConsumption,
      this.newConsumption,
      this.usageConsumption});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || meter != null) {
      map['meter_id'] = Variable<String>(meter);
    }
    map['station'] = Variable<String>(station);
    map['village'] = Variable<String>(village);
    if (!nullToAbsent || odooID != null) {
      map['odoo_id'] = Variable<int>(odooID);
    }
    map['odoo_zone_id'] = Variable<int>(odooZoneId);
    map['zone'] = Variable<String>(zone);
    if (!nullToAbsent || locationCode != null) {
      map['location_code'] = Variable<String>(locationCode);
    }
    if (!nullToAbsent || previousConsumption != null) {
      map['previous_consumption'] = Variable<int>(previousConsumption);
    }
    if (!nullToAbsent || newConsumption != null) {
      map['new_consumption'] = Variable<int>(newConsumption);
    }
    if (!nullToAbsent || usageConsumption != null) {
      map['usage_consumption'] = Variable<int>(usageConsumption);
    }
    return map;
  }

  CustomerModelCompanion toCompanion(bool nullToAbsent) {
    return CustomerModelCompanion(
      id: Value(id),
      name: Value(name),
      meter:
          meter == null && nullToAbsent ? const Value.absent() : Value(meter),
      station: Value(station),
      village: Value(village),
      odooID:
          odooID == null && nullToAbsent ? const Value.absent() : Value(odooID),
      odooZoneId: Value(odooZoneId),
      zone: Value(zone),
      locationCode: locationCode == null && nullToAbsent
          ? const Value.absent()
          : Value(locationCode),
      previousConsumption: previousConsumption == null && nullToAbsent
          ? const Value.absent()
          : Value(previousConsumption),
      newConsumption: newConsumption == null && nullToAbsent
          ? const Value.absent()
          : Value(newConsumption),
      usageConsumption: usageConsumption == null && nullToAbsent
          ? const Value.absent()
          : Value(usageConsumption),
    );
  }

  factory CustomerModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerModelData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      meter: serializer.fromJson<String?>(json['meter']),
      station: serializer.fromJson<String>(json['station']),
      village: serializer.fromJson<String>(json['village']),
      odooID: serializer.fromJson<int?>(json['odooID']),
      odooZoneId: serializer.fromJson<int>(json['odooZoneId']),
      zone: serializer.fromJson<String>(json['zone']),
      locationCode: serializer.fromJson<String?>(json['locationCode']),
      previousConsumption:
          serializer.fromJson<int?>(json['previousConsumption']),
      newConsumption: serializer.fromJson<int?>(json['newConsumption']),
      usageConsumption: serializer.fromJson<int?>(json['usageConsumption']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'meter': serializer.toJson<String?>(meter),
      'station': serializer.toJson<String>(station),
      'village': serializer.toJson<String>(village),
      'odooID': serializer.toJson<int?>(odooID),
      'odooZoneId': serializer.toJson<int>(odooZoneId),
      'zone': serializer.toJson<String>(zone),
      'locationCode': serializer.toJson<String?>(locationCode),
      'previousConsumption': serializer.toJson<int?>(previousConsumption),
      'newConsumption': serializer.toJson<int?>(newConsumption),
      'usageConsumption': serializer.toJson<int?>(usageConsumption),
    };
  }

  CustomerModelData copyWith(
          {int? id,
          String? name,
          Value<String?> meter = const Value.absent(),
          String? station,
          String? village,
          Value<int?> odooID = const Value.absent(),
          int? odooZoneId,
          String? zone,
          Value<String?> locationCode = const Value.absent(),
          Value<int?> previousConsumption = const Value.absent(),
          Value<int?> newConsumption = const Value.absent(),
          Value<int?> usageConsumption = const Value.absent()}) =>
      CustomerModelData(
        id: id ?? this.id,
        name: name ?? this.name,
        meter: meter.present ? meter.value : this.meter,
        station: station ?? this.station,
        village: village ?? this.village,
        odooID: odooID.present ? odooID.value : this.odooID,
        odooZoneId: odooZoneId ?? this.odooZoneId,
        zone: zone ?? this.zone,
        locationCode:
            locationCode.present ? locationCode.value : this.locationCode,
        previousConsumption: previousConsumption.present
            ? previousConsumption.value
            : this.previousConsumption,
        newConsumption:
            newConsumption.present ? newConsumption.value : this.newConsumption,
        usageConsumption: usageConsumption.present
            ? usageConsumption.value
            : this.usageConsumption,
      );
  @override
  String toString() {
    return (StringBuffer('CustomerModelData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('meter: $meter, ')
          ..write('station: $station, ')
          ..write('village: $village, ')
          ..write('odooID: $odooID, ')
          ..write('odooZoneId: $odooZoneId, ')
          ..write('zone: $zone, ')
          ..write('locationCode: $locationCode, ')
          ..write('previousConsumption: $previousConsumption, ')
          ..write('newConsumption: $newConsumption, ')
          ..write('usageConsumption: $usageConsumption')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      meter,
      station,
      village,
      odooID,
      odooZoneId,
      zone,
      locationCode,
      previousConsumption,
      newConsumption,
      usageConsumption);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerModelData &&
          other.id == this.id &&
          other.name == this.name &&
          other.meter == this.meter &&
          other.station == this.station &&
          other.village == this.village &&
          other.odooID == this.odooID &&
          other.odooZoneId == this.odooZoneId &&
          other.zone == this.zone &&
          other.locationCode == this.locationCode &&
          other.previousConsumption == this.previousConsumption &&
          other.newConsumption == this.newConsumption &&
          other.usageConsumption == this.usageConsumption);
}

class CustomerModelCompanion extends UpdateCompanion<CustomerModelData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> meter;
  final Value<String> station;
  final Value<String> village;
  final Value<int?> odooID;
  final Value<int> odooZoneId;
  final Value<String> zone;
  final Value<String?> locationCode;
  final Value<int?> previousConsumption;
  final Value<int?> newConsumption;
  final Value<int?> usageConsumption;
  const CustomerModelCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.meter = const Value.absent(),
    this.station = const Value.absent(),
    this.village = const Value.absent(),
    this.odooID = const Value.absent(),
    this.odooZoneId = const Value.absent(),
    this.zone = const Value.absent(),
    this.locationCode = const Value.absent(),
    this.previousConsumption = const Value.absent(),
    this.newConsumption = const Value.absent(),
    this.usageConsumption = const Value.absent(),
  });
  CustomerModelCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.meter = const Value.absent(),
    required String station,
    required String village,
    this.odooID = const Value.absent(),
    required int odooZoneId,
    required String zone,
    this.locationCode = const Value.absent(),
    this.previousConsumption = const Value.absent(),
    this.newConsumption = const Value.absent(),
    this.usageConsumption = const Value.absent(),
  })  : name = Value(name),
        station = Value(station),
        village = Value(village),
        odooZoneId = Value(odooZoneId),
        zone = Value(zone);
  static Insertable<CustomerModelData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? meter,
    Expression<String>? station,
    Expression<String>? village,
    Expression<int>? odooID,
    Expression<int>? odooZoneId,
    Expression<String>? zone,
    Expression<String>? locationCode,
    Expression<int>? previousConsumption,
    Expression<int>? newConsumption,
    Expression<int>? usageConsumption,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (meter != null) 'meter_id': meter,
      if (station != null) 'station': station,
      if (village != null) 'village': village,
      if (odooID != null) 'odoo_id': odooID,
      if (odooZoneId != null) 'odoo_zone_id': odooZoneId,
      if (zone != null) 'zone': zone,
      if (locationCode != null) 'location_code': locationCode,
      if (previousConsumption != null)
        'previous_consumption': previousConsumption,
      if (newConsumption != null) 'new_consumption': newConsumption,
      if (usageConsumption != null) 'usage_consumption': usageConsumption,
    });
  }

  CustomerModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? meter,
      Value<String>? station,
      Value<String>? village,
      Value<int?>? odooID,
      Value<int>? odooZoneId,
      Value<String>? zone,
      Value<String?>? locationCode,
      Value<int?>? previousConsumption,
      Value<int?>? newConsumption,
      Value<int?>? usageConsumption}) {
    return CustomerModelCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      meter: meter ?? this.meter,
      station: station ?? this.station,
      village: village ?? this.village,
      odooID: odooID ?? this.odooID,
      odooZoneId: odooZoneId ?? this.odooZoneId,
      zone: zone ?? this.zone,
      locationCode: locationCode ?? this.locationCode,
      previousConsumption: previousConsumption ?? this.previousConsumption,
      newConsumption: newConsumption ?? this.newConsumption,
      usageConsumption: usageConsumption ?? this.usageConsumption,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (meter.present) {
      map['meter_id'] = Variable<String>(meter.value);
    }
    if (station.present) {
      map['station'] = Variable<String>(station.value);
    }
    if (village.present) {
      map['village'] = Variable<String>(village.value);
    }
    if (odooID.present) {
      map['odoo_id'] = Variable<int>(odooID.value);
    }
    if (odooZoneId.present) {
      map['odoo_zone_id'] = Variable<int>(odooZoneId.value);
    }
    if (zone.present) {
      map['zone'] = Variable<String>(zone.value);
    }
    if (locationCode.present) {
      map['location_code'] = Variable<String>(locationCode.value);
    }
    if (previousConsumption.present) {
      map['previous_consumption'] = Variable<int>(previousConsumption.value);
    }
    if (newConsumption.present) {
      map['new_consumption'] = Variable<int>(newConsumption.value);
    }
    if (usageConsumption.present) {
      map['usage_consumption'] = Variable<int>(usageConsumption.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomerModelCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('meter: $meter, ')
          ..write('station: $station, ')
          ..write('village: $village, ')
          ..write('odooID: $odooID, ')
          ..write('odooZoneId: $odooZoneId, ')
          ..write('zone: $zone, ')
          ..write('locationCode: $locationCode, ')
          ..write('previousConsumption: $previousConsumption, ')
          ..write('newConsumption: $newConsumption, ')
          ..write('usageConsumption: $usageConsumption')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $ZoneModelTable zoneModel = $ZoneModelTable(this);
  late final $CustomerModelTable customerModel = $CustomerModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [zoneModel, customerModel];
}
