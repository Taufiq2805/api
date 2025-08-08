import 'package:flutter/material.dart';
import 'package:xii_rpl_3/models/post_model.dart';
import 'package:xii_rpl_3/pages/posts/detail_posts_screen.dart';
import 'package:xii_rpl_3/services/post_service.dart';

class ListPostScreen extends StatelessWidget {
  const ListPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Postingan'),
        backgroundColor: Color.fromARGB(255, 1, 88, 250),
      ),
      body: FutureBuilder<List<PostModel>>(
        future: PostService.listPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final posts = snapshot.data ?? [];

          if (posts.isEmpty) {
            return const Center(child: Text('Tidak ada data'));
          }

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PostDetailScreen(
                        id: post.id.toString(),
                        title: post.title,
                        body: post.body,
                        userId: post.userId.toString(),
                      ),
                    ),
                  );
                },
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(post.id.toString()),
                    backgroundColor: Color.fromARGB(255, 55, 0, 255),
                    foregroundColor: Colors.white,
                  ),
                  title: Text(post.title),
                  subtitle: Text('User ID: ${post.userId}'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
