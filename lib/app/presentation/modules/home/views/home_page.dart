import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_freezed/app/domain/models/character.dart';
import 'package:riverpod_freezed/app/presentation/modules/home/providers/character_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(charactersProvider);

    return Scaffold(
      body: provider.when(
        loading: () => CircularProgressIndicator(),
        failed: (failure) {
          return Text(failure.toString());
        },
        loaded: (characters) {
          return Container(
            height: double.maxFinite,
            width: double.infinity,
            child: ListView.builder(
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  Character character = characters[index];

                  return ListTile(
                    title: Text(character.name),
                    trailing: Image.network(character.image),
                    leading: Text(character.id.toString()),
                    subtitle: Text(character.gender),
                  );
                }),
          );
        },
      ),
    );
  }
}
