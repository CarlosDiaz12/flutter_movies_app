import 'package:flutter_movies_app/data/mapper/base_mapper.dart';
import 'package:flutter_movies_app/data/remote/response/guest_session_list_id_response.dart';
import 'package:flutter_movies_app/domain/models/guest_session_list_info.dart';

class GuestSessionListIdMapper
    extends BaseMapper<GuestSessionListInfo, GuestSessionListIdResponse> {
  @override
  GuestSessionListIdResponse toDto(GuestSessionListInfo model) {
    throw UnimplementedError();
  }

  @override
  GuestSessionListInfo toModel(GuestSessionListIdResponse dto) {
    return GuestSessionListInfo(
      list_id: dto.list_id,
    );
  }
}
