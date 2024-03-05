// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alterar_senha_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlterarSenhaDTOImpl _$$AlterarSenhaDTOImplFromJson(Map json) =>
    _$AlterarSenhaDTOImpl(
      codUsuario: json['codUsuario'] as int,
      senhaAntiga: json['senhaAntiga'] as String,
      senhaNova: json['senhaNova'] as String,
      confirmacaoSenhaNova: json['confirmacaoSenhaNova'] as String,
    );

Map<String, dynamic> _$$AlterarSenhaDTOImplToJson(
        _$AlterarSenhaDTOImpl instance) =>
    <String, dynamic>{
      'codUsuario': instance.codUsuario,
      'senhaAntiga': instance.senhaAntiga,
      'senhaNova': instance.senhaNova,
      'confirmacaoSenhaNova': instance.confirmacaoSenhaNova,
    };
