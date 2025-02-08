import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/local_database/hive_service.dart';
import '../../../core/models/hive_model.dart';
import '../../../data/repositories/api/api_services.dart';
import '../../../utils/services/network_service.dart';


 part 'home_screen_event.dart';
 part 'home_screen_state.dart';


class StarGithubBloc extends Bloc<StarGithubEvent, StarGithubState> {
  final ApiService apiService = ApiService();

  StarGithubBloc() : super(StarGithubInitial()) {
    on<FetchStarGithubRepos>(_onFetchStarGithubRepos);
  }

  Future<void> _onFetchStarGithubRepos(FetchStarGithubRepos event, Emitter<StarGithubState> emit) async {
    emit(StarGithubLoading());
    bool isConnected = await NetworkConnectivity.checkConnectivity();
    debugPrint("-----------------isNetworkOn -------------- $isConnected");
    try {
      if(isConnected){
        await ApiService().fetchAndStoreItems();
      }
      final List<Item> items = HiveService().getItems() ?? [];
      debugPrint("hive item length---------------------------------------${items.length}");
      emit(StarGithubLoaded(items));
    } catch (e) {
      debugPrint("is getting errorrrrrrrrrrrrrrrrrrrrrrr : ${e.toString()}");
      emit(StarGithubError(e.toString()));
    }
  }
}