import 'package:github/github.dart';

///Github API
class GitHubAPI {
  ///GitHub
  static final GitHub _git = GitHub();

  ///Get Repositories
  static Future<List<Repository>> getRepositories() async {
    //Get Repositories
    final reposStream = _git.repositories.listUserRepositories("danfq");

    //List of Repositories
    final repos = await reposStream.toList();

    //Remove Unwanted Repositories
    repos.removeWhere(
        (repo) => repo.name == "danfq.github.io" || repo.name == "danfq");

    //Return List of Repositories
    return repos;
  }
}
