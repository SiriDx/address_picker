class AddressProvince {
  int id;
  String provinceid;
  String province;
  String lng;
  String lat;
  List<AddressCity> cities;

  AddressProvince(
      {this.id,
      this.provinceid,
      this.province,
      this.lng,
      this.lat,
      this.cities});

  AddressProvince.fromJson(Map<String, dynamic> json, {Map<String, AddressCity> cityMap, Map<String, AddressDistrict> districtMap}) {
    id = json['id'];
    provinceid = json['provinceid'];
    province = json['province'];
    lng = json['lng'];
    lat = json['lat'];
    if (json['cities'] != null) {
      cities = new List<AddressCity>();
      json['cities'].forEach((v) {
        var city = AddressCity.fromJson(v, districtMap: districtMap);
        cityMap[city.cityid] = city;
        cities.add(city);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['provinceid'] = this.provinceid;
    data['province'] = this.province;
    data['lng'] = this.lng;
    data['lat'] = this.lat;
    if (this.cities != null) {
      data['cities'] = this.cities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddressCity {
  int id;
  String city;
  String cityid;
  String provinceid;
  String lng;
  String lat;
  List<AddressDistrict> district;

  AddressCity(
      {this.id,
      this.city,
      this.cityid,
      this.provinceid,
      this.lng,
      this.lat,
      this.district});

  AddressCity.fromJson(Map<String, dynamic> json, {Map<String, AddressDistrict> districtMap}) {
    id = json['id'];
    city = json['city'];
    cityid = json['cityid'];
    provinceid = json['provinceid'];
    lng = json['lng'];
    lat = json['lat'];
    if (json['district'] != null) {
      district = new List<AddressDistrict>();
      json['district'].forEach((v) {
        var dis = AddressDistrict.fromJson(v);
        districtMap[dis.areaid] = dis;
        district.add(dis);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city'] = this.city;
    data['cityid'] = this.cityid;
    data['provinceid'] = this.provinceid;
    data['lng'] = this.lng;
    data['lat'] = this.lat;
    if (this.district != null) {
      data['district'] = this.district.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddressDistrict {
  int id;
  String area;
  String areaid;
  String cityid;
  String lng;
  String lat;

  AddressDistrict({this.id, this.area, this.areaid, this.cityid, this.lng, this.lat});

  AddressDistrict.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    area = json['area'];
    areaid = json['areaid'];
    cityid = json['cityid'];
    lng = json['lng'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['area'] = this.area;
    data['areaid'] = this.areaid;
    data['cityid'] = this.cityid;
    data['lng'] = this.lng;
    data['lat'] = this.lat;
    return data;
  }
}