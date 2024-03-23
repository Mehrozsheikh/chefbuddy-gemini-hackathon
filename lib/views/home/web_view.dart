import 'package:chef_buddy/constants/assets.dart';
import 'package:chef_buddy/constants/colors.dart';
import 'package:chef_buddy/views/chat/chat_view.dart';
import 'package:chef_buddy/views/info/info_screen.dart';
import 'package:chef_buddy/views/recipe_generate/recipe_generate_view.dart';
import 'package:chef_buddy/widgets/suggestions_widget.dart';
import 'package:chef_buddy/widgets/tools_widget.dart';
import 'package:flutter/material.dart';

class WebHomeView extends StatelessWidget {
  const WebHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height,
                color: kPrimaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              20,
                            ),
                          ),
                          border: Border.fromBorderSide(
                            BorderSide(
                              color: Colors.white,
                              width: 4,
                            ),
                          ),
                          image: DecorationImage(
                            image: AssetImage(kLogo),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SuggestionWidget(
                        text: 'What to cook today?',
                        isWeb: true,
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
                        isWeb: true,
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
                        isWeb: true,
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
                        isWeb: true,
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
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height,
                color: kPrimaryColor.withOpacity(0.15),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 20),
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
                                    fontSize: 24,
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
                        const SizedBox(
                          height: 80,
                        ),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final maxWidth = constraints.maxWidth;

                            if (maxWidth < 640) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ToolWidget(
                                    image: kChatbot,
                                    title: 'Chef Buddy',
                                    description: 'Chat with Chef Buddy',
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return const ChatScreen(
                                              message: "",
                                              preQuestions: [
                                                'What to cook today?',
                                                'How to cook Alfredo pasta?',
                                                'How to make a cheese cake?',
                                                'Suggest delicious recipes',
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ToolWidget(
                                    image: kIngredients,
                                    title: 'Ingredients to Recipe',
                                    description: 'Get Recipe from Ingredients',
                                    onTap: () {
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
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ToolWidget(
                                    image: kFood,
                                    title: 'Food to Recipe',
                                    description: 'Chat with Chef Buddy',
                                    onTap: () {
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
                                    },
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ToolWidget(
                                        image: kChatbot,
                                        title: 'Chef Buddy',
                                        description: 'Chat with Chef Buddy',
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return const ChatScreen(
                                                  message: "",
                                                  preQuestions: [
                                                    'What to cook today?',
                                                    'How to cook Alfredo pasta?',
                                                    'How to make a cheese cake?',
                                                    'Suggest delicious recipes',
                                                  ],
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                      ToolWidget(
                                        image: kIngredients,
                                        title: 'Ingredients to Recipe',
                                        description:
                                            'Get Recipe from Ingredients',
                                        onTap: () {
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
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  ToolWidget(
                                    image: kFood,
                                    title: 'Food to Recipe',
                                    description: 'Chat with Chef Buddy',
                                    onTap: () {
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
                                    },
                                  ),
                                ],
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
