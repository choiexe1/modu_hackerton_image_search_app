import 'package:flutter/material.dart';
import 'package:modu_image_search_app/presentation/image/image_screen_view_model.dart';

class ImageScreen extends StatefulWidget {
  final ImageScreenViewModel viewModel;
  final int imageId;

  const ImageScreen({
    required this.imageId,
    super.key,
    required this.viewModel,
  });

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchImage(widget.imageId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.imageId}')),

      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, _) {
          final state = widget.viewModel.state;

          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.image != null) {
            return Column(
              spacing: 23,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 428,
                  child: Image.network(
                    state.image!.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Text(
                      'user : ${state.image!.username}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'tags : ${state.image!.tags.toList().where((e) => e != '[' && e != ']').toList().join(', ')}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return const Center(child: Text('No image found'));
          }
        },
      ),
    );
  }
}
