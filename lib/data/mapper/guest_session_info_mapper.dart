import 'package:flutter_movies_app/data/mapper/base_mapper.dart';
import 'package:flutter_movies_app/data/remote/response/get_guest_session_id.dart';
import 'package:flutter_movies_app/domain/models/guest_session_info.dart';

class GuestSessionInfoMapper
    extends BaseMapper<GuestSessionInfo, GetGuestSessionIdResponse> {
  @override
  GetGuestSessionIdResponse toDto(GuestSessionInfo model) {
    throw UnimplementedError();
  }

  @override
  GuestSessionInfo toModel(GetGuestSessionIdResponse dto) {
    return GuestSessionInfo(
      guest_session_id: dto.guest_session_id,
      expires_at: dto.expires_at,
    );
  }
}
