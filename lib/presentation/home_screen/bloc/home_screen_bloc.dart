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
  final HiveService hiveService = HiveService();
  List<Item> items = [];


  StarGithubBloc() : super(StarGithubInitial()) {

    on<FetchStarGithubRepos>(_onFetchStarGithubRepos);
  }

  Future<void> _onFetchStarGithubRepos(
      FetchStarGithubRepos event, Emitter<StarGithubState> emit) async {
    debugPrint('is the event is firing 2 times firstly?');

      emit(StarGithubLoading());
      if(event.page == 1)
        {
          items.clear();
        }

    bool isConnected = await NetworkConnectivity.checkConnectivity();
    debugPrint("-----------------isNetworkOn -------------- $isConnected");

    try {
      debugPrint('is the try catch is loading 2 times????????????????');
      if (isConnected) {
        List<Item> newItems = await apiService.fetchAndStoreItems(
          clearAll: event.clearAll,
          page: event.page,
        ) ??
            [];
        debugPrint('--------------------bloc item length-------------${newItems.length}');

        if (newItems.isEmpty) {
          debugPrint('1st one----------------------------------');
          emit(StarGithubLoaded(items, false)); // No more data
        } else {
          items.addAll(newItems);
          debugPrint('2nd one----------------------------------${items.length}');

          emit(StarGithubLoaded(items, true)); // Still more data
        }
      } else {
        items = hiveService.getItems();
        emit(StarGithubLoaded(items, false));
      }
    } catch (e) {
      debugPrint("Error while fetching: ${e.toString()}");
      emit(StarGithubError(e.toString()));
    }
  }

}









// on<FetchStarGithubRepos>(_onFetchStarGithubRepos);
// }

// Future<void> _onFetchStarGithubRepos(FetchStarGithubRepos event, Emitter<StarGithubState> emit) async {
//   emit(StarGithubLoading());
//   bool isConnected = await NetworkConnectivity.checkConnectivity();
//   debugPrint("-----------------isNetworkOn -------------- $isConnected");
//   try {
//     if(isConnected){
//       await ApiService().fetchAndStoreItems();
//     }
//     final List<Item> items = HiveService().getItems() ?? [];
//     debugPrint("hive item length---------------------------------------${items.length}");
//     emit(StarGithubLoaded(items));
//   } catch (e) {
//     debugPrint("is getting errorrrrrrrrrrrrrrrrrrrrrrr : ${e.toString()}");
//     emit(StarGithubError(e.toString()));
//   }
// }
// }