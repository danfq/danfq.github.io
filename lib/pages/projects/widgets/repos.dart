import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:portfolio/util/github/api.dart';

class Repos extends StatelessWidget {
  const Repos({super.key, required this.onRepoSelected});

  ///On Repo Selected
  final void Function(Repository repo) onRepoSelected;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: GitHubAPI.getRepositories(),
      builder: (context, snapshot) {
        //Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        //Error
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        //Check Data
        if (snapshot.data == null || snapshot.data!.isEmpty) {
          return const Center(child: Text("Failed to Load Repositories"));
        }

        //Data
        if (snapshot.data != null && snapshot.data!.isNotEmpty) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              //Repo
              final repo = snapshot.data![index];

              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    title: Text(repo.name),
                    onTap: () {
                      onRepoSelected(repo);
                    },
                  ),
                ),
              );
            },
          );
        }

        //Default
        return const Center(child: Text("No Repositories Found"));
      },
    );
  }
}
