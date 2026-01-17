import 'package:freezed_annotation/freezed_annotation.dart';

part 'vmess_share_dto.freezed.dart';
part 'vmess_share_dto.g.dart';

// see: https://github.com/2dust/v2rayN/wiki/Description-of-VMess-share-link
// {
//     "v": "2",
//     "ps": " 备注或别名  ",
//     "add": "111.111.111.111",
//     "port": "32000",
//     "id": "1386f85e-657b-4d6e-9d56-78badb75e1fd",
//     "aid": "100",
//     "scy": "zero",
//     "net": "tcp",
//     "type": "none",
//     "host": "www.bbb.com",
//     "path": "/",
//     "tls": "tls",
//     "sni": "www.ccc.com",
//     "alpn": "h2",
//     "fp": "chrome"
// }

@freezed
abstract class VmessShareDto with _$VmessShareDto {
  factory VmessShareDto({
    String? v,
    String? ps,
    String? add,
    String? port,
    String? id,
    String? aid,
    String? scy,
    String? net,
    String? type,
    String? host,
    String? path,
    String? tls,
    String? sni,
    String? alpn,
    String? fp,
  }) = _VmessShareDto;

  factory VmessShareDto.fromJson(Map<String, dynamic> json) =>
      _$VmessShareDtoFromJson(json);
}
