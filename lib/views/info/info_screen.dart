import 'package:chef_buddy/constants/colors.dart';
import 'package:chef_buddy/services/url_launcher_services.dart';
import 'package:chef_buddy/widgets/dev_widget.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Chef Buddy',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Made with ❤️ by',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth > 750) {
                  return const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DeveloperWidget(
                        name: "Mehroz Sheikh",
                        imageUrl: "assets/images/mehroz.png",
                        linkedinUrl: 'https://www.linkedin.com/in/mehrozsheikh',
                      ),
                      DeveloperWidget(
                        name: "Faizan Rizwan",
                        imageUrl: "assets/images/faizi.png",
                        linkedinUrl:
                            'https://www.linkedin.com/in/faizan-rizwan-028194279',
                      ),
                      DeveloperWidget(
                        name: "Faizan Abbas",
                        imageUrl: "assets/images/faizan.png",
                        linkedinUrl:
                            'https://www.linkedin.com/in/aizaz-ahmad-bb11602a3',
                      ),
                      DeveloperWidget(
                        name: "Aizaz Ahmad",
                        imageUrl: "assets/images/aizaz.png",
                        linkedinUrl:
                            'https://www.linkedin.com/in/faizan-abbas-057b29262',
                      ),
                      DeveloperWidget(
                        name: "Mahnoor Khalid",
                        imageUrl: "assets/images/mahnoor.png",
                        linkedinUrl:
                            'https://www.linkedin.com/in/mahnoor-khalid-897661212',
                      ),
                    ],
                  );
                } else {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DeveloperWidget(
                            name: "Mehroz Sheikh",
                            imageUrl: "assets/images/mehroz.png",
                            linkedinUrl:
                                'https://www.linkedin.com/in/mehrozsheikh',
                          ),
                          DeveloperWidget(
                            name: "Faizan Rizwan",
                            imageUrl: "assets/images/faizi.png",
                            linkedinUrl:
                                'https://www.linkedin.com/in/faizan-rizwan-028194279',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DeveloperWidget(
                            name: "Faizan Abbas",
                            imageUrl: "assets/images/faizan.png",
                            linkedinUrl:
                                'https://www.linkedin.com/in/aizaz-ahmad-bb11602a3',
                          ),
                          DeveloperWidget(
                            name: "Aizaz Ahmad",
                            imageUrl: "assets/images/aizaz.png",
                            linkedinUrl:
                                'https://www.linkedin.com/in/faizan-abbas-057b29262',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DeveloperWidget(
                        name: "Mahnoor Khalid",
                        imageUrl: "assets/images/mahnoor.png",
                        linkedinUrl:
                            'https://www.linkedin.com/in/mahnoor-khalid-897661212',
                      ),
                    ],
                  );
                }
              }),
              const SizedBox(
                height: 100,
              ),
              // BOTTOM
              Container(
                height: 265,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Techroz Solutions',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Transforming your ideas into Reality',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              UrlLauncher.launchURL(
                                'https://www.facebook.com/people/Techroz-Solutions/100095018884287',
                              );
                            },
                            child: Image.asset(
                              'assets/images/facebook_ic.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              UrlLauncher.launchURL(
                                'https://www.linkedin.com/company/techroz-solutions',
                              );
                            },
                            child: Image.asset(
                              'assets/images/linkedin_ic.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              UrlLauncher.launchURL(
                                'https://www.instagram.com/techroz_solutions',
                              );
                            },
                            child: Image.asset(
                              'assets/images/insta_ic.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ],
                      )
                    ],
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
