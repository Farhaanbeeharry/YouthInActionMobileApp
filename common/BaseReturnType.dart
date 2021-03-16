abstract class ReturnModel {
  ReturnModel cast(Map<String, dynamic> json);
}

class BaseReturnType<T> extends ReturnModel {
  dynamic data;
  String error;
  String msg;
  bool success;

  T processedData;

  bool isValid;

  @override
  BaseReturnType cast(Map<String, dynamic> json) {
    this.data = json['data'];
    this.error = json['error'];
    this.msg = json['msg'];
    this.success = json['success'];
    // this._checkResponse();
    return this;
  }

  List<String> _invalidError = ["unauthorized", "invalidtoken", "timeout"];
  List<String> _invalidSQuery = ["invalidtoken", "timeout"];

  _checkResponse() {
    this.isValid = this.success;
  }
}

class MasterDataItems<T> {
  List<T> data;
}
