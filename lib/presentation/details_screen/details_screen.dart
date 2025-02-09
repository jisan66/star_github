import 'package:flutter/material.dart';
import 'package:star_github/core/models/hive_model.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:star_github/utils/themes/custom_theme.dart';
import '../../utils/services/date_formatter.dart';

class DetailsScreen extends StatelessWidget {
  final Item? item;

  const DetailsScreen({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    debugPrint('----------------------------------${item?.updatedAt ?? ''}');
    String date = DateFormatter().formatDateString(item?.updatedAt ?? '');

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: Text('Repo Owner Details')),
      body: SingleChildScrollView(
        // Allow the content to scroll
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // The image section can now scroll
              Container(
                padding: EdgeInsets.all(16),
                color: primaryColor,
                child: Center(
                  child: Column(
                    spacing: 24,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 150,
                        width: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: FastCachedImage(
                            loadingBuilder: (context, progress) {
                              return Center(
                                child: Text(
                                  "Loading...",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white.withValues(alpha : .2),
                                  ),
                                ),
                              );
                            },
                            url: item?.owner?.avatarUrl ?? "",
                            fit: BoxFit.cover,
                            fadeInDuration: const Duration(seconds: 1),
                            errorBuilder: (context, exception, stackTrace) {
                              return Center(
                                child: Icon(
                                  Icons.broken_image_outlined,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              );
                            },
                          ),
                        ),
                      )
                      ,
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 350
                        ),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: namePlateColor,
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: Colors.white.withValues(alpha: .15)),
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            item?.owner?.login ?? '',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 24,
                thickness: 0.1,
              ),
              // Repository details
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                color: Color(0xFF161b22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Repository Name : ${item?.name ?? ''}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Repository Description',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      item?.description ?? '',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Last update : $date',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
