import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:soma_utility/db/app_db.dart';

class ZoneProvider extends ChangeNotifier{
  AppDb? _appDb;

  void initAppDb(AppDb db){
    _appDb = db;
  }

  List<ZoneModelData> _zoneList = [];
  List<ZoneModelData> get zoneList => _zoneList;
  List<ZoneModelData> _zoneListStream = [];
  UnmodifiableListView<ZoneModelData> get zoneListStream => UnmodifiableListView(_zoneListStream);
  ZoneModelData? _zoneData;
  ZoneModelData? get zoneData => _zoneData;

  String _stringError = '';
  String get stringError => _stringError;
  bool _added = false;
  bool get added => _added;
  bool _isUpdated = false;
  bool get isUpdated => _isUpdated;
  bool _isDeleted = false;
  bool get isDeleted => _isDeleted;

  void getZonesFuture(){
    _appDb?.getZones().then((value){
      _zoneList = value;
      notifyListeners();
    }).onError((error, stackTrace){
      _stringError = error.toString();
      notifyListeners();
    });
  }
  void getZonesStream(){
    _appDb?.getZonesStream().listen((event) {
      _zoneListStream = event;
    });
    notifyListeners();
  }
  void getSingleZone(int id){
    _appDb?.getZone(id).then((value){
      _zoneData = value;
    }).onError((error, stackTrace){
      _stringError = error.toString();
    });
    notifyListeners();
  }
  Future<void> newZone(ZoneModelCompanion zone)async {
    _appDb?.newZone(zone).then((value){
      _added = value == 1 ? true : false;
      notifyListeners();
    }).onError((error, stackTrace){
      _stringError = error.toString();
    });
    notifyListeners();
  }
  void updateZone(ZoneModelCompanion zone){
    _appDb?.updateZone(zone).then((value){
      _isUpdated = value;
    }).onError((error, stackTrace){
      _stringError = error.toString();
    });
    notifyListeners();
  }
  void deleteZone(int id){
    _appDb?.removeZone(id).then((value){
      _isDeleted = value == 1 ? true : false;
    }).onError((error, stackTrace) {
      _stringError = error.toString();
    });
    notifyListeners();
  }

  Future<void> emptyZones() async {
    _appDb?.emptyZones().then((value){
      _isDeleted = value == 1 ? true: false;
    }).onError((error, stackTrace){
      _stringError = error.toString();
    });
    notifyListeners();
  }
}