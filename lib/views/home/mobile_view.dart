import 'package:chef_buddy/constants/assets.dart';
import 'package:chef_buddy/constants/colors.dart';
import 'package:chef_buddy/views/chat/chat_view.dart';
import 'package:chef_buddy/views/info/info_screen.dart';
import 'package:chef_buddy/views/recipe_generate/recipe_generate_view.dart';
import 'package:chef_buddy/widgets/suggestions_widget.dart';
import 'package:chef_buddy/widgets/tools_widget.dart';
import 'package:flutter/material.dart';

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          leadingWidth: 70,
          centerTitle: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    12,
                  ),
                ),
                image: DecorationImage(
                  image: AssetImage(kChatbot),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to,',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Chef Buddy',
                      style: TextStyle(
                        fontSize: 18,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const InfoScreen();
                    }));
                  },
                  icon: const Icon(
                    Icons.info,
                    color: kPrimaryColor,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tools',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return ToolWidget(
                        title: index == 0
                            ? 'Chef Buddy'
                            : index == 1
                                ? 'Ingredients to Recipe'
                                : 'Food to Recipe',
                        image: index == 0
                            ? kLogo
                            : index == 1
                                ? kIngredients
                                : kFood,
                        description: index == 0
                            ? 'Chat with Chef Buddy'
                            : index == 1
                                ? 'Get Recipe from Ingredients'
                                : 'Chat with Chef Buddy',
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ChatScreen(
                                    message: "",
                                    preQuestions: [
                                      "What to cook today?",
                                      "How to cook Alfredo pasta?",
                                      "How to make a cheese cake?",
                                      "Suggest delicious recipes",
                                    ],
                                  );
                                },
                              ),
                            );
                          } else if (index == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const RecipeGenerateView(
                                    isIngredient: true,
                                  );
                                },
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const RecipeGenerateView(
                                    isIngredient: false,
                                  );
                                },
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Suggestions',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SuggestionWidget(
                  text: 'What to cook today?',
                  isWeb: false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ChatScreen(
                            message: "What to cook today?",
                            preQuestions: [
                              'How to cook Alfredo pasta?',
                              'How to make a cheese cake?',
                              'Suggest delicious recipes',
                              'Quick recipes for dinner',
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                SuggestionWidget(
                  text: 'How to cook Alfredo pasta?',
                  isWeb: false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ChatScreen(
                            message: "How to cook Alfredo pasta?",
                            preQuestions: [
                              'What to cook today?',
                              'How to make a cheese cake?',
                              'Suggest delicious recipes',
                              'Quick recipes for dinner',
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                SuggestionWidget(
                  text: 'How to make a cheese cake?',
                  isWeb: false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ChatScreen(
                            message: "How to make a cheese cake?",
                            preQuestions: [
                              'What to cook today?',
                              'How to cook Alfredo pasta?',
                              'Suggest delicious recipes',
                              'Quick recipes for dinner',
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                SuggestionWidget(
                  text: 'Suggest delicious recipes',
                  isWeb: false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ChatScreen(
                            message: "Suggest delicious recipes",
                            preQuestions: [
                              'What to cook today?',
                              'How to cook Alfredo pasta?',
                              'How to make a cheese cake?',
                              'Quick recipes for dinner',
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
