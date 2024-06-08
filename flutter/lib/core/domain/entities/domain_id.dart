import 'package:freezed_annotation/freezed_annotation.dart';

part 'domain_id.freezed.dart';

@freezed
class DomainId with _$DomainId {
  const factory DomainId.stringId({
    required String id,
  }) = _StringId;

  const factory DomainId.intId({
    required int id,
  }) = _IntId;

  const DomainId._();

  @override
  String toString() => when(stringId: (s) => s, intId: (s) => s.toString());

  int toInt({int defaultValue = 0}) => when(stringId: (s) => int.tryParse(s) ?? defaultValue, intId: (i) => i);
}
