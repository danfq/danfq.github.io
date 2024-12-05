import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:github/github.dart';
import 'package:get/get.dart';
import 'package:portfolio/pages/projects/widgets/repos.dart';
import 'package:portfolio/util/toast/handler.dart';
import 'package:portfolio/util/widgets/buttons.dart';
import 'package:portfolio/util/widgets/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatelessWidget {
  Projects({super.key});

  final Rx<Repository?> selectedRepo = Rx<Repository?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainWidgets.appBar(title: const Text("Projects")),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Mobile layout
            if (constraints.maxWidth < 800) {
              return Column(
                children: [
                  // Project List
                  SizedBox(
                    height: 200, // Fixed height for mobile
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Repos(
                        onRepoSelected: (repo) {
                          selectedRepo.value = repo;
                        },
                      ),
                    ),
                  ),

                  // Project Details
                  Expanded(
                    child: Column(
                      children: [
                        MainWidgets.pageTitle(title: "Project Details"),
                        Expanded(
                          child: Obx(
                            () => selectedRepo.value == null
                                ? const Center(
                                    child: Text(
                                      "Select a Project from the List",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  )
                                : SingleChildScrollView(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        //Repo Name
                                        Text(
                                          selectedRepo.value!.name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        //Spacing
                                        const SizedBox(height: 8),

                                        //Creation Date
                                        Card(
                                          child: Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.all(16.0),
                                            child: ListTile(
                                              tileColor: Colors.transparent,
                                              title: const Text(
                                                "Creation Date",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              trailing: Text(
                                                selectedRepo.value!.createdAt
                                                    .toString()
                                                    .split(" ")[0],
                                              ),
                                            ),
                                          ),
                                        ),

                                        //Spacing
                                        const SizedBox(height: 8),

                                        //Repo Size
                                        Card(
                                          child: Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.all(16.0),
                                            child: ListTile(
                                              tileColor: Colors.transparent,
                                              title: const Text(
                                                "Size",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              trailing: Text(
                                                "${selectedRepo.value!.size / 1024} MB",
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),

                                        //Spacing
                                        const SizedBox(height: 8),

                                        //Repo Description
                                        Card(
                                          child: Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.all(16.0),
                                            child: ListTile(
                                              tileColor: Colors.transparent,
                                              title: const Text(
                                                "Description",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              subtitle: Text(
                                                selectedRepo.value!.description,
                                              ),
                                            ),
                                          ),
                                        ),

                                        //Spacing
                                        const SizedBox(height: 28.0),

                                        // Buttons in column for mobile
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Buttons.elevatedIcon(
                                              icon: Feather.github,
                                              text: "Copy Clone URL",
                                              onTap: () async {
                                                await Clipboard.setData(
                                                  ClipboardData(
                                                    text: selectedRepo
                                                        .value!.cloneUrl,
                                                  ),
                                                );
                                                ToastHandler.toast(
                                                  message:
                                                      "Copied Clone URL to Clipboard",
                                                );
                                              },
                                            ),
                                            const SizedBox(height: 10),
                                            Buttons.elevatedIcon(
                                              icon: Feather.github,
                                              text: "View on GitHub",
                                              onTap: () async {
                                                await launchUrl(
                                                  Uri.parse(
                                                    selectedRepo.value!.htmlUrl,
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            // Desktop layout (original)
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Repos(
                      onRepoSelected: (repo) {
                        selectedRepo.value = repo;
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      MainWidgets.pageTitle(title: "Project Details"),
                      Expanded(
                        child: Obx(
                          () => selectedRepo.value == null
                              ? const Center(
                                  child: Text(
                                    "Select a Project from the List",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      //Repo Name
                                      Text(
                                        selectedRepo.value!.name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      //Spacing
                                      const SizedBox(height: 8),

                                      //Creation Date
                                      Card(
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(16.0),
                                          child: ListTile(
                                            tileColor: Colors.transparent,
                                            title: const Text(
                                              "Creation Date",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            trailing: Text(
                                              selectedRepo.value!.createdAt
                                                  .toString()
                                                  .split(" ")[0],
                                            ),
                                          ),
                                        ),
                                      ),

                                      //Spacing
                                      const SizedBox(height: 8),

                                      //Repo Size
                                      Card(
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(16.0),
                                          child: ListTile(
                                            tileColor: Colors.transparent,
                                            title: const Text(
                                              "Size",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            trailing: Text(
                                              "${selectedRepo.value!.size / 1024} MB",
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ),

                                      //Spacing
                                      const SizedBox(height: 8),

                                      //Repo Description
                                      Card(
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(16.0),
                                          child: ListTile(
                                            tileColor: Colors.transparent,
                                            title: const Text(
                                              "Description",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            subtitle: Text(
                                              selectedRepo.value!.description,
                                            ),
                                          ),
                                        ),
                                      ),

                                      //Spacing
                                      const SizedBox(height: 28.0),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Buttons.elevatedIcon(
                                            icon: Feather.github,
                                            text: "Copy Clone URL",
                                            onTap: () async {
                                              await Clipboard.setData(
                                                ClipboardData(
                                                  text: selectedRepo
                                                      .value!.cloneUrl,
                                                ),
                                              );
                                              ToastHandler.toast(
                                                message:
                                                    "Copied Clone URL to Clipboard",
                                              );
                                            },
                                          ),
                                          Buttons.elevatedIcon(
                                            icon: Feather.github,
                                            text: "View on GitHub",
                                            onTap: () async {
                                              await launchUrl(
                                                Uri.parse(
                                                  selectedRepo.value!.htmlUrl,
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
