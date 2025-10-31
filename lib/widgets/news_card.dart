import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_articles.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  final NewsArticles? article;
  final VoidCallback? onTap;

  const NewsCard({
    super.key,
    required this.article,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (article == null) return SizedBox.shrink();

    return GestureDetector(
      onTap: onTap ?? () {},
      child: Card(
        margin: EdgeInsets.only(bottom: 16),
        elevation: 3,
        color: AppColors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // bagian gambar
            ClipRRect(
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(14)),
              child: CachedNetworkImage(
                imageUrl: (article!.urlToImage?.isNotEmpty ?? false)
                    ? article!.urlToImage!
                    : 'https://via.placeholder.com/800x400',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 180,
                  color: AppColors.divider.withValues(alpha: 0.3),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 180,
                  color: AppColors.divider.withValues(alpha: 0.3),
                ),
              ),
            ),
            // bagian teks
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // source
                  if (article!.source?.name != null)
                    Text(
                      article!.source!.name!,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  SizedBox(height: 10),
                  // title
                  Text(
                    article!.title ?? 'No title',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 8),
                  // deskripsi
                  if (article!.description != null)
                    Text(
                      article!.description!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  SizedBox(height: 10),
                  // timeago
                  Text(
                    (article!.publishedAt != null)
                        ? timeago.format(
                            DateTime.tryParse(article!.publishedAt!) ??
                                DateTime.now())
                        : 'Unknown date',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
