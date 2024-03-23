import 'package:chef_buddy/services/url_launcher_services.dart';
import 'package:flutter/material.dart';

class DeveloperWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String linkedinUrl;
  const DeveloperWidget(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.linkedinUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 40,
          child: IconButton(
              onPressed: () {
                UrlLauncher.launchURL(linkedinUrl);
              },
              icon: Image.asset('assets/images/linkedin_ic.png')),
        ),
      ],
    );
  }
}
