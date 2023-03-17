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
  static const VerificationMeta _khmerNameMeta =
      const VerificationMeta('khmerName');
  @override
  late final GeneratedColumn<String> khmerName = GeneratedColumn<String>(
      'khmer_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _locationIdMeta =
      const VerificationMeta('locationId');
  @override
  late final GeneratedColumn<int> locationId = GeneratedColumn<int>(
      'location_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _zoneNameMeta =
      const VerificationMeta('zoneName');
  @override
  late final GeneratedColumn<String> zoneName = GeneratedColumn<String>(
      'zone_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _zoneIdMeta = const VerificationMeta('zoneId');
  @override
  late final GeneratedColumn<int> zoneId = GeneratedColumn<int>(
      'zone_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _newConsumptionMeta =
      const VerificationMeta('newConsumption');
  @override
  late final GeneratedColumn<int> newConsumption = GeneratedColumn<int>(
      'new_consumption', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _prevConsumptionMeta =
      const VerificationMeta('prevConsumption');
  @override
  late final GeneratedColumn<int> prevConsumption = GeneratedColumn<int>(
      'prev_consumption', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _totalConsumptionMeta =
      const VerificationMeta('totalConsumption');
  @override
  late final GeneratedColumn<int> totalConsumption = GeneratedColumn<int>(
      'total_consumption', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        khmerName,
        locationId,
        zoneName,
        zoneId,
        newConsumption,
        prevConsumption,
        totalConsumption
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
    if (data.containsKey('khmer_name')) {
      context.handle(_khmerNameMeta,
          khmerName.isAcceptableOrUnknown(data['khmer_name']!, _khmerNameMeta));
    }
    if (data.containsKey('location_id')) {
      context.handle(
          _locationIdMeta,
          locationId.isAcceptableOrUnknown(
              data['location_id']!, _locationIdMeta));
    }
    if (data.containsKey('zone_name')) {
      context.handle(_zoneNameMeta,
          zoneName.isAcceptableOrUnknown(data['zone_name']!, _zoneNameMeta));
    }
    if (data.containsKey('zone_id')) {
      context.handle(_zoneIdMeta,
          zoneId.isAcceptableOrUnknown(data['zone_id']!, _zoneIdMeta));
    }
    if (data.containsKey('new_consumption')) {
      context.handle(
          _newConsumptionMeta,
          newConsumption.isAcceptableOrUnknown(
              data['new_consumption']!, _newConsumptionMeta));
    }
    if (data.containsKey('prev_consumption')) {
      context.handle(
          _prevConsumptionMeta,
          prevConsumption.isAcceptableOrUnknown(
              data['prev_consumption']!, _prevConsumptionMeta));
    }
    if (data.containsKey('total_consumption')) {
      context.handle(
          _totalConsumptionMeta,
          totalConsumption.isAcceptableOrUnknown(
              data['total_consumption']!, _totalConsumptionMeta));
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
      khmerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}khmer_name']),
      locationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}location_id']),
      zoneName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}zone_name']),
      zoneId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}zone_id']),
      newConsumption: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}new_consumption']),
      prevConsumption: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}prev_consumption']),
      totalConsumption: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_consumption']),
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
  final String? khmerName;
  final int? locationId;
  final String? zoneName;
  final int? zoneId;
  final int? newConsumption;
  final int? prevConsumption;
  final int? totalConsumption;
  const CustomerModelData(
      {required this.id,
      required this.name,
      this.khmerName,
      this.locationId,
      this.zoneName,
      this.zoneId,
      this.newConsumption,
      this.prevConsumption,
      this.totalConsumption});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || khmerName != null) {
      map['khmer_name'] = Variable<String>(khmerName);
    }
    if (!nullToAbsent || locationId != null) {
      map['location_id'] = Variable<int>(locationId);
    }
    if (!nullToAbsent || zoneName != null) {
      map['zone_name'] = Variable<String>(zoneName);
    }
    if (!nullToAbsent || zoneId != null) {
      map['zone_id'] = Variable<int>(zoneId);
    }
    if (!nullToAbsent || newConsumption != null) {
      map['new_consumption'] = Variable<int>(newConsumption);
    }
    if (!nullToAbsent || prevConsumption != null) {
      map['prev_consumption'] = Variable<int>(prevConsumption);
    }
    if (!nullToAbsent || totalConsumption != null) {
      map['total_consumption'] = Variable<int>(totalConsumption);
    }
    return map;
  }

  CustomerModelCompanion toCompanion(bool nullToAbsent) {
    return CustomerModelCompanion(
      id: Value(id),
      name: Value(name),
      khmerName: khmerName == null && nullToAbsent
          ? const Value.absent()
          : Value(khmerName),
      locationId: locationId == null && nullToAbsent
          ? const Value.absent()
          : Value(locationId),
      zoneName: zoneName == null && nullToAbsent
          ? const Value.absent()
          : Value(zoneName),
      zoneId:
          zoneId == null && nullToAbsent ? const Value.absent() : Value(zoneId),
      newConsumption: newConsumption == null && nullToAbsent
          ? const Value.absent()
          : Value(newConsumption),
      prevConsumption: prevConsumption == null && nullToAbsent
          ? const Value.absent()
          : Value(prevConsumption),
      totalConsumption: totalConsumption == null && nullToAbsent
          ? const Value.absent()
          : Value(totalConsumption),
    );
  }

  factory CustomerModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerModelData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      khmerName: serializer.fromJson<String?>(json['khmerName']),
      locationId: serializer.fromJson<int?>(json['locationId']),
      zoneName: serializer.fromJson<String?>(json['zoneName']),
      zoneId: serializer.fromJson<int?>(json['zoneId']),
      newConsumption: serializer.fromJson<int?>(json['newConsumption']),
      prevConsumption: serializer.fromJson<int?>(json['prevConsumption']),
      totalConsumption: serializer.fromJson<int?>(json['totalConsumption']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'khmerName': serializer.toJson<String?>(khmerName),
      'locationId': serializer.toJson<int?>(locationId),
      'zoneName': serializer.toJson<String?>(zoneName),
      'zoneId': serializer.toJson<int?>(zoneId),
      'newConsumption': serializer.toJson<int?>(newConsumption),
      'prevConsumption': serializer.toJson<int?>(prevConsumption),
      'totalConsumption': serializer.toJson<int?>(totalConsumption),
    };
  }

  CustomerModelData copyWith(
          {int? id,
          String? name,
          Value<String?> khmerName = const Value.absent(),
          Value<int?> locationId = const Value.absent(),
          Value<String?> zoneName = const Value.absent(),
          Value<int?> zoneId = const Value.absent(),
          Value<int?> newConsumption = const Value.absent(),
          Value<int?> prevConsumption = const Value.absent(),
          Value<int?> totalConsumption = const Value.absent()}) =>
      CustomerModelData(
        id: id ?? this.id,
        name: name ?? this.name,
        khmerName: khmerName.present ? khmerName.value : this.khmerName,
        locationId: locationId.present ? locationId.value : this.locationId,
        zoneName: zoneName.present ? zoneName.value : this.zoneName,
        zoneId: zoneId.present ? zoneId.value : this.zoneId,
        newConsumption:
            newConsumption.present ? newConsumption.value : this.newConsumption,
        prevConsumption: prevConsumption.present
            ? prevConsumption.value
            : this.prevConsumption,
        totalConsumption: totalConsumption.present
            ? totalConsumption.value
            : this.totalConsumption,
      );
  @override
  String toString() {
    return (StringBuffer('CustomerModelData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('khmerName: $khmerName, ')
          ..write('locationId: $locationId, ')
          ..write('zoneName: $zoneName, ')
          ..write('zoneId: $zoneId, ')
          ..write('newConsumption: $newConsumption, ')
          ..write('prevConsumption: $prevConsumption, ')
          ..write('totalConsumption: $totalConsumption')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, khmerName, locationId, zoneName,
      zoneId, newConsumption, prevConsumption, totalConsumption);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerModelData &&
          other.id == this.id &&
          other.name == this.name &&
          other.khmerName == this.khmerName &&
          other.locationId == this.locationId &&
          other.zoneName == this.zoneName &&
          other.zoneId == this.zoneId &&
          other.newConsumption == this.newConsumption &&
          other.prevConsumption == this.prevConsumption &&
          other.totalConsumption == this.totalConsumption);
}

class CustomerModelCompanion extends UpdateCompanion<CustomerModelData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> khmerName;
  final Value<int?> locationId;
  final Value<String?> zoneName;
  final Value<int?> zoneId;
  final Value<int?> newConsumption;
  final Value<int?> prevConsumption;
  final Value<int?> totalConsumption;
  const CustomerModelCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.khmerName = const Value.absent(),
    this.locationId = const Value.absent(),
    this.zoneName = const Value.absent(),
    this.zoneId = const Value.absent(),
    this.newConsumption = const Value.absent(),
    this.prevConsumption = const Value.absent(),
    this.totalConsumption = const Value.absent(),
  });
  CustomerModelCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.khmerName = const Value.absent(),
    this.locationId = const Value.absent(),
    this.zoneName = const Value.absent(),
    this.zoneId = const Value.absent(),
    this.newConsumption = const Value.absent(),
    this.prevConsumption = const Value.absent(),
    this.totalConsumption = const Value.absent(),
  }) : name = Value(name);
  static Insertable<CustomerModelData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? khmerName,
    Expression<int>? locationId,
    Expression<String>? zoneName,
    Expression<int>? zoneId,
    Expression<int>? newConsumption,
    Expression<int>? prevConsumption,
    Expression<int>? totalConsumption,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (khmerName != null) 'khmer_name': khmerName,
      if (locationId != null) 'location_id': locationId,
      if (zoneName != null) 'zone_name': zoneName,
      if (zoneId != null) 'zone_id': zoneId,
      if (newConsumption != null) 'new_consumption': newConsumption,
      if (prevConsumption != null) 'prev_consumption': prevConsumption,
      if (totalConsumption != null) 'total_consumption': totalConsumption,
    });
  }

  CustomerModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? khmerName,
      Value<int?>? locationId,
      Value<String?>? zoneName,
      Value<int?>? zoneId,
      Value<int?>? newConsumption,
      Value<int?>? prevConsumption,
      Value<int?>? totalConsumption}) {
    return CustomerModelCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      khmerName: khmerName ?? this.khmerName,
      locationId: locationId ?? this.locationId,
      zoneName: zoneName ?? this.zoneName,
      zoneId: zoneId ?? this.zoneId,
      newConsumption: newConsumption ?? this.newConsumption,
      prevConsumption: prevConsumption ?? this.prevConsumption,
      totalConsumption: totalConsumption ?? this.totalConsumption,
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
    if (khmerName.present) {
      map['khmer_name'] = Variable<String>(khmerName.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<int>(locationId.value);
    }
    if (zoneName.present) {
      map['zone_name'] = Variable<String>(zoneName.value);
    }
    if (zoneId.present) {
      map['zone_id'] = Variable<int>(zoneId.value);
    }
    if (newConsumption.present) {
      map['new_consumption'] = Variable<int>(newConsumption.value);
    }
    if (prevConsumption.present) {
      map['prev_consumption'] = Variable<int>(prevConsumption.value);
    }
    if (totalConsumption.present) {
      map['total_consumption'] = Variable<int>(totalConsumption.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomerModelCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('khmerName: $khmerName, ')
          ..write('locationId: $locationId, ')
          ..write('zoneName: $zoneName, ')
          ..write('zoneId: $zoneId, ')
          ..write('newConsumption: $newConsumption, ')
          ..write('prevConsumption: $prevConsumption, ')
          ..write('totalConsumption: $totalConsumption')
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
