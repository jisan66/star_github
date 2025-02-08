import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../core/local_database/hive_service.dart';
import '../../../core/models/hive_model.dart';
import '../../../data/repositories/api/api_services.dart';


 part 'home_screen_event.dart';
 part 'home_screen_state.dart';


class StarGithubBloc extends Bloc<StarGithubEvent, StarGithubState> {
  final ApiService apiService = ApiService();

  StarGithubBloc() : super(StarGithubInitial()) {
    on<FetchStarGithubRepos>(_onFetchStarGithubRepos);
  }

  Future<void> _onFetchStarGithubRepos(FetchStarGithubRepos event, Emitter<StarGithubState> emit) async {
    emit(StarGithubLoading());
    try {
      await ApiService().fetchAndStoreItems();
      final items = HiveService.getItems();
      emit(StarGithubLoaded(items));
    } catch (e) {
      emit(StarGithubError(e.toString()));
    }
  }
}