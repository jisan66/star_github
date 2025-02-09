import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_github/core/models/hive_model.dart';
import 'package:star_github/presentation/details_screen/details_screen.dart';
import 'package:star_github/presentation/home_screen/bloc/home_screen_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  bool _isFetchingMore = false; // Track if more data is being fetched

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    // context.read<StarGithubBloc>().add(FetchStarGithubRepos(true, _currentPage)); // Initial Fetch
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
      double currentPosition = _scrollController.hasClients ? _scrollController.position.pixels : 0; // Check if attached

      _currentPage++;
      context.read<StarGithubBloc>().add(FetchStarGithubRepos(false, _currentPage));

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(currentPosition); // Restore position only if attached
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
      backgroundColor: Color(0xFF17181c),
      appBar: AppBar(title: Text("Most Starred Repo")),
      body: BlocConsumer<StarGithubBloc, StarGithubState>(
        listener: (context, state) {
          if (state is StarGithubLoaded) {
            _isFetchingMore = false; // Reset flag after successful load
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
                itemCount: state.items.length + (state.hasMore ? 1 : 0), // Extra item for loader
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
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DetailsScreen(item: item)),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Repo Name: ${item.name ?? 'No Name Found'}',
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Repo Full Name: ${item.fullName ?? "No Name Found"}',
                                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      index.toString(),
                                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                                    ),
                                    Icon(Icons.star, color: Colors.yellow, size: 18),
                                    SizedBox(width: 5),
                                    Text(
                                      item.score.toString(),
                                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF17181c),
                                    size: 14,
                                  ),
                                ),
                              ),
                            )

                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: Colors.white54, height: 0.05);
                },
              ),
            );
          } else if (state is StarGithubError) {
            return Center(
              child: Text(
                "Error: ${state.message}",
                style: TextStyle(color: Colors.white),
              ),
            );
          } else if (state is StarGithubLoading && _currentPage > 1) {
            // ✅ Show CircularProgressIndicator when paginating (not on first page)
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
