part of 'home_screen_bloc.dart';

@immutable
abstract class StarGithubEvent {}

class FetchStarGithubRepos extends StarGithubEvent {
  final int page;
  final bool clearAll;
  FetchStarGithubRepos(this.clearAll, this.page);
}