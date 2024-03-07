part of 'detail_bloc.dart';

sealed class DetailEvent {}

final class OnGetUserDetailEvent extends DetailEvent {
  final String id;

  OnGetUserDetailEvent({required this.id});
}
