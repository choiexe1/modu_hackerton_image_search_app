import 'package:json_annotation/json_annotation.dart';

part 'image_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ImageDTO {
  final int? id;

  @JsonKey(name: 'user')
  final String? username;

  @JsonKey(name: 'webformatURL')
  final String? imageUrl;

  @JsonKey(name: 'tags')
  final String? tags;

  ImageDTO(this.id, this.username, this.imageUrl, this.tags);

  factory ImageDTO.fromJson(Map<String, dynamic> json) =>
      _$ImageDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDTOToJson(this);
}
