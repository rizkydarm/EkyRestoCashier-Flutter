part of 'table_manag_bloc.dart';

@freezed
class TableManagementState with _$TableManagementState {
  const factory TableManagementState.initial() = _Initial;
  const factory TableManagementState.loading() = _Loading;
  const factory TableManagementState.success(List<RestaurantTable> tables) = _Success;
  const factory TableManagementState.error(String message) = _Error;
}
