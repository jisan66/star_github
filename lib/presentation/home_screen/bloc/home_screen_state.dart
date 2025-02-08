part of 'home_screen_bloc.dart';

@immutable
abstract class StarGithubState{}

class StarGithubInitial extends StarGithubState {}

class StarGithubLoading extends StarGithubState {}

class StarGithubLoaded extends StarGithubState {
  final List<Item> items;
  final bool hasMore;
  StarGithubLoaded(this.items, this.hasMore);
}

class StarGithubError extends StarGithubState {
  final String message;
  StarGithubError(this.message);
}