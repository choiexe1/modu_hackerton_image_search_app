import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modu_image_search_app/presentation/component/search_bar.dart';
import 'package:modu_image_search_app/presentation/home/home_screen_view_model.dart';

class HomeScreen extends StatefulWidget {
  final HomeScreenViewModel viewModel;

  const HomeScreen({super.key, required this.viewModel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchImages('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 33),
          child: Column(
            spacing: 24,
            children: [
              AppSearchBar(
                onSubmit: (value) => widget.viewModel.fetchImages(value),
              ),
              ListenableBuilder(
                listenable: widget.viewModel,
                builder: (context, child) {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: widget.viewModel.state.images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.push(
                              '/image/${widget.viewModel.state.images[index].id}',
                            );
                          },
                          child: Container(
                            width: 166,
                            height: 166,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.network(
                              widget.viewModel.state.images[index].imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 34,
                        crossAxisSpacing: 36,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
