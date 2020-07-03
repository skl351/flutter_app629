/// ret : 200
/// data : {"list":[{"id":"344","title":"押金测试9","avatar":"http://pics.dev.mayisishu.com/Files/Ant_Headimgs/102_newant_1590477848_headimg.jpg","master":"102","member_num":"5","price":"29.90","deposit":"0.00","s_date":"2020-08-04 00:00:00","e_date":"2020-09-03 00:00:00","watch_type":"3","watch_price":"0.00","master_name":"来看看","camp_day":31,"stop_day":"34天后"}],"count":"3"}
/// msg : ""

class Maindata {
  int _ret;
  Data _data;
  String _msg;

  int get ret => _ret;
  Data get data => _data;
  String get msg => _msg;

  Maindata({int ret, Data data, String msg}){
    _ret = ret;
    _data = data;
    _msg = msg;
}

  Maindata.map(dynamic obj) {
    _ret = obj["ret"];
    _data = obj["data"] != null ? Data.map(obj["data"]) : null;
    _msg = obj["msg"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["ret"] = _ret;
    if (_data != null) {
      map["data"] = _data.toMap();
    }
    map["msg"] = _msg;
    return map;
  }

}

/// list : [{"id":"344","title":"押金测试9","avatar":"http://pics.dev.mayisishu.com/Files/Ant_Headimgs/102_newant_1590477848_headimg.jpg","master":"102","member_num":"5","price":"29.90","deposit":"0.00","s_date":"2020-08-04 00:00:00","e_date":"2020-09-03 00:00:00","watch_type":"3","watch_price":"0.00","master_name":"来看看","camp_day":31,"stop_day":"34天后"}]
/// count : "3"

class Data {
  List<List_item> _list;
  String _count;

  List<List_item> get list => _list;
  String get count => _count;

  Data({List<List_item> list, String count}){
    _list = list;
    _count = count;
}

  Data.map(dynamic obj) {
    if (obj["list"] != null) {
      _list = [];
      obj["list"].forEach((v) {
        _list.add(List_item.map(v));
      });
    }
    _count = obj["count"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (_list != null) {
      map["list"] = _list.map((v) => v.toMap()).toList();
    }
    map["count"] = _count;
    return map;
  }

}

/// id : "344"
/// title : "押金测试9"
/// avatar : "http://pics.dev.mayisishu.com/Files/Ant_Headimgs/102_newant_1590477848_headimg.jpg"
/// master : "102"
/// member_num : "5"
/// price : "29.90"
/// deposit : "0.00"
/// s_date : "2020-08-04 00:00:00"
/// e_date : "2020-09-03 00:00:00"
/// watch_type : "3"
/// watch_price : "0.00"
/// master_name : "来看看"
/// camp_day : 31
/// stop_day : "34天后"

class List_item {
  String _id;
  String _title;
  String _avatar;
  String _master;
  String _member_num;
  String _price;
  String _deposit;
  String _sDate;
  String _eDate;
  String _watchType;
  String _watchPrice;
  String _master_name;
  int _camp_day;
  String _stop_day;

  String get id => _id;
  String get title => _title;
  String get avatar => _avatar;
  String get master => _master;
  String get memberNum => _member_num;
  String get price => _price;
  String get deposit => _deposit;
  String get sDate => _sDate;
  String get eDate => _eDate;
  String get watchType => _watchType;
  String get watchPrice => _watchPrice;
  String get masterName => _master_name;
  int get campDay => _camp_day;
  String get stopDay => _stop_day;

  List({String id, String title, String avatar, String master, String memberNum, String price, String deposit, String sDate, String eDate, String watchType, String watchPrice, String masterName, int campDay, String stopDay}){
    _id = id;
    _title = title;
    _avatar = avatar;
    _master = master;
    _member_num = memberNum;
    _price = price;
    _deposit = deposit;
    _sDate = sDate;
    _eDate = eDate;
    _watchType = watchType;
    _watchPrice = watchPrice;
    _master_name = masterName;
    _camp_day = campDay;
    _stop_day = stopDay;
}

  List_item.map(dynamic obj) {
    _id = obj["id"];
    _title = obj["title"];
    _avatar = obj["avatar"];
    _master = obj["master"];
    _member_num = obj["member_num"];
    _price = obj["price"];
    _deposit = obj["deposit"];
    _sDate = obj["sDate"];
    _eDate = obj["eDate"];
    _watchType = obj["watchType"];
    _watchPrice = obj["watchPrice"];
    _master_name = obj["master_name"];
    _camp_day = obj["camp_day"];
    _stop_day = obj["stop_day"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["title"] = _title;
    map["avatar"] = _avatar;
    map["master"] = _master;
    map["member_num"] = _member_num;
    map["price"] = _price;
    map["deposit"] = _deposit;
    map["sDate"] = _sDate;
    map["eDate"] = _eDate;
    map["watchType"] = _watchType;
    map["watchPrice"] = _watchPrice;
    map["master_name"] = _master_name;
    map["camp_day"] = _camp_day;
    map["stop_day"] = _stop_day;
    return map;
  }

}