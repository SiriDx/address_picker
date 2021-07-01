import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'address_model.dart';

abstract class AddressManager {

  static List<AddressProvince>? _provinces;
  static Map<String, AddressProvince> _provinceMap = Map<String, AddressProvince>();
  static Map<String, AddressCity> _cityMap = Map<String, AddressCity>();
  static Map<String, AddressDistrict> _districtMap = Map<String, AddressDistrict>();

  static Future<List<AddressProvince>> loadAddressData (
      BuildContext context) async {

    if (_provinces != null && (_provinces?.isNotEmpty ?? false)) {
      return _provinces!;
    }
    var address = await rootBundle.loadString('packages/address_picker/assets/address.json');
    var data = json.decode(address);
      var provinces = <AddressProvince>[];
      if (data is List) {
        data.forEach((v) {
          var province = AddressProvince.fromJson(v, cityMap: _cityMap, districtMap: _districtMap);
          if (province.provinceid != null) {
            _provinceMap[province.provinceid!] = province;
          }
          provinces.add(province);
        });
        _provinces = provinces;
        return _provinces!;
      }
      return <AddressProvince>[];
  }

  static Future<AddressProvince?> getProvince(BuildContext context, String provinceId) async {
    if (_provinceMap.isEmpty) {
      var provinces = await loadAddressData(context);
      if (provinces.isNotEmpty) {
        return _provinceMap[provinceId];
      }
      return null;
    } else {
      return _provinceMap[provinceId];
    }
  }

  static Future<AddressCity?> getCity(BuildContext context, String cityId) async {
    if (_cityMap.isEmpty) {
      var provinces = await loadAddressData(context);
      if (provinces.isNotEmpty) {
        return _cityMap[cityId];
      }
      return null;
    } else {
      return _cityMap[cityId];
    }
  }

  static Future<AddressDistrict?> getDistrict(BuildContext context, String districtId) async {
    if (_districtMap.isEmpty) {
      var provinces = await loadAddressData(context);
      if (provinces.isNotEmpty) {
        return _districtMap[districtId];
      }
      return null;
    } else {
      return _districtMap[districtId];
    }
  }
}
