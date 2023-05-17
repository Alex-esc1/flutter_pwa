import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://freshmarket.by/shop/');

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/welcome_image.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
            children: [
              const SizedBox(height: 250),
               Center(
                child: Image.asset(
                  "assets/logo.png",
                  height: 120,
                   ),
              ),
              const Center(
                  child: Text(
                'Только свежие фрукты и овощи',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )),
            const SizedBox(
              height: 50,
            ),
            getButton(context),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    ));
  }


          

  Widget getButton(BuildContext context) {
    return ElevatedButton(
      onPressed: _launchUrl,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.amber,
        backgroundColor: Colors.black, 
        elevation: 10,
      ),
      child: const Text('Перейти в каталог', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
