import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_infinite_list/post_observer.dart';
import 'package:flutter_bloc_infinite_list/posts/bloc/post_bloc.dart';
import 'package:flutter_bloc_infinite_list/posts/models/post.dart';
import 'package:flutter_bloc_infinite_list/posts/views/posts_list.dart';
import 'package:http/http.dart' as http;

void main() {
  Bloc.observer = const PostObserver();
  runApp(const PostsPage());
}

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (_) =>
              PostBloc(httpClient: http.Client())..add(const PostFetched()),
          child: const PostsList(),
        ),
      ),
    );
  }
}
