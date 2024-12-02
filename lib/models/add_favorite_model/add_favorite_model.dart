import 'dart:convert';

class AddFavoriteModel {
  bool? success;
  int? statusCode;
  String? statusMessage;

  AddFavoriteModel({
    this.success,
    this.statusCode,
    this.statusMessage,
  });

  AddFavoriteModel copyWith({
    bool? success,
    int? statusCode,
    String? statusMessage,
  }) {
    return AddFavoriteModel(
      success: success ?? this.success,
      statusCode: statusCode ?? this.statusCode,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'status_code': statusCode,
      'status_message': statusMessage,
    };
  }

  factory AddFavoriteModel.fromMap(Map<String, dynamic> map) {
    return AddFavoriteModel(
      success: map['success'] != null ? map['success'] as bool : null,
      statusCode: map['status_code'] != null ? map['status_code'] as int : null,
      statusMessage: map['status_message'] != null
          ? map['status_message'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddFavoriteModel.fromJson(String source) =>
      AddFavoriteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AddFavoriteModel(success: $success, status_code: $statusCode, status_message: $statusMessage)';

  @override
  bool operator ==(covariant AddFavoriteModel other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.statusCode == statusCode &&
        other.statusMessage == statusMessage;
  }

  @override
  int get hashCode =>
      success.hashCode ^ statusCode.hashCode ^ statusMessage.hashCode;
}
