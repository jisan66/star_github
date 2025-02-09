import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_github/core/models/hive_model.dart';
import 'package:star_github/presentation/home_screen/bloc/home_screen_bloc.dart';
import 'package:star_github/presentation/home_screen/widgets/repo_list_card.dart';
import 'package:star_github/utils/themes/custom_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  bool _isFetchingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
      debugPrint('------------==============_fetchMoreData()');
      _fetchMoreData();
    }
  }

  void _fetchMoreData() {
    final state = context.read<StarGithubBloc>().state;

    if (state is StarGithubLoaded && state.hasMore && !_isFetchingMore) {
      _isFetchingMore = true;
      double currentPosition = _scrollController.hasClients ? _scrollController.position.pixels : 0;

      _currentPage++;
      context.read<StarGithubBloc>().add(FetchStarGithubRepos(false, _currentPage));

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(currentPosition);
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: Text("Most Starred Repo")),
      body: BlocConsumer<StarGithubBloc, StarGithubState>(
        listener: (context, state) {
          if (state is StarGithubLoaded) {
            _isFetchingMore = false;
          }
        },
        builder: (context, state) {
          if (state is StarGithubLoading && _currentPage == 1) {
            return Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else if (state is StarGithubLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                _currentPage = 1;
                context.read<StarGithubBloc>().add(FetchStarGithubRepos(true, _currentPage));
              },
              child: ListView.separated(
                key: PageStorageKey('repoList'),
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: state.items.length + (state.hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == state.items.length) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    );
                  }

                  Item item = state.items[index];
                  return RepoListCard(item: item,);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: Colors.white54, height: 0.05);
                },
              ),
            );
          } else if (state is StarGithubError) {
            return Center(
              child: Text(
                "Something went wrong",
                style: TextStyle(color: Colors.white),
              ),
            );
          } else if (state is StarGithubLoading && _currentPage > 1) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(color: Colors.white),
              ),
            );
          }

          return Center(
            child: Text(
              "No Data Available",
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
