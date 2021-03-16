import 'dart:convert';

KeyValue clientFromJson(String str) {
  final jsonData = json.decode(str);
  return KeyValue.fromMap(jsonData);
}

String clientToJson(KeyValue data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class KeyValue {

  String id;
  String key;
  String value;

  KeyValue ({this.id, this.key, this.value});

  factory KeyValue.fromMap(Map<String, dynamic> json) => new KeyValue(
    id: json["id"],
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "key": key,
    "value": value,
  };

}