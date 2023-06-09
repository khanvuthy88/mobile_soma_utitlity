import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:soma_utility/db/app_db.dart';

class CustomerProvider extends ChangeNotifier {
  AppDb? _appDb;

  void initAppDb(AppDb db){
    _appDb = db;
  }

  List<CustomerModelData> _customerList = [];
  UnmodifiableListView<CustomerModelData> get customerList => UnmodifiableListView(_customerList);
  List<CustomerModelData> _customerByZoneList = [];
  List<CustomerModelData> get customerByZoneList => _customerByZoneList;
  List<CustomerModelData> _customerListStream = [];
  UnmodifiableListView<CustomerModelData> get customerListStream => UnmodifiableListView(_customerListStream);
  CustomerModelData? _customerData;
  CustomerModelData? get customerData => _customerData;
  String _error = '';
  String get error => _error;
  bool _isAdded = false;
  bool get isAdded => _isAdded;
  bool _isUpdated = false;
  bool get isUpdated => _isUpdated;
  bool _isDeleted = false;
  bool get isDeleted => _isDeleted;

  void getCustomersFuture(){
    _appDb?.getCustomers().then((value){
      _customerList = value;
      notifyListeners();
    }).onError((error, stackTrace){
      _error = error.toString();
      notifyListeners();
    });
    notifyListeners();
  }
  void getCustomerByZone(int zoneId){
    _appDb?.getCustomerByZone(zoneId).then((value) {
      _customerByZoneList = value;
      notifyListeners();
    }).onError((error, stackTrace){
      _error = error.toString();
    });
    notifyListeners();
  }

  void getCustomersStream(){
    _appDb?.getCustomersStream().listen((event) {
      _customerListStream = event;
    });
    notifyListeners();
  }
  void getCustomer(int id){
    _appDb?.getCustomer(id).then((value){
      _customerData = value;
    }).onError((error, stackTrace){
      _error = error.toString();
    });
    notifyListeners();
  }
  Future<void> newCustomer(CustomerModelCompanion customer)async {
    debugPrint("method newcustomer called $customer");
    _appDb?.newCustomer(customer).then((value){
      _isAdded = value == 1 ? true : false;
      notifyListeners();
    }).onError((error, stackTrace){
      _error = error.toString();
    });
    notifyListeners();
  }
  void updateCustomer(CustomerModelCompanion customer){
    _appDb?.updateCustomer(customer).then((value){
      _isUpdated = value;
      notifyListeners();
    }).onError((error, stackTrace){
      _error = error.toString();
    });
    notifyListeners();
  }
  void removeCustomer(int id){
    _appDb?.removeCustomer(id).then((value){
      _isDeleted = value == 1 ? true : false;
    }).onError((error, stackTrace){
      _error = error.toString();
    });
    notifyListeners();
  }
  Future<void> emptyCustomer() async {
    _appDb?.emptyCustomer().then((value){
      _isDeleted = value == 1 ? true: false;
    }).onError((error, stackTrace){
      _error = error.toString();
    });
    notifyListeners();
  }

}