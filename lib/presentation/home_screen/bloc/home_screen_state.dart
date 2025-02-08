part of 'home_screen_bloc.dart';

@immutable
abstract class StarGithubState{}

class StarGithubInitial extends StarGithubState {}

class StarGithubLoading extends StarGithubState {}

class StarGithubLoaded extends StarGithubState {
  final List<Item> items;
  final bool hasMoreData;
  StarGithubLoaded(this.items, this.hasMoreData);
}

class StarGithubError extends StarGithubState {
  final String message;
  StarGithubError(this.message);
}