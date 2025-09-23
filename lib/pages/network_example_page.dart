import 'package:flutter/material.dart';
import 'package:learn_app/models/album.dart';
import 'package:learn_app/services/network_service.dart';

class NetworkExamplePage extends StatelessWidget {
  const NetworkExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NetworkService networkService = NetworkService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Networking Example'),
        centerTitle: true,
      ),
      body: FutureBuilder<Album?>(
        future: networkService.getRequest(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator.adaptive());
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final album = snapshot.data;
            if (album == null) {
              return const Text("No Album Available");
            }
            return Center(
              child: Column(
                children: <Widget>[
                  Text(album.id.toString()),
                  const SizedBox(height: 12),
                  Text(album.title),
                  const SizedBox(height: 12),
                  Text(album.userId.toString()),
                  const SizedBox(height: 12),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
