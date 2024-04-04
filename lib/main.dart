import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = "Navigation and routing 2";
    return MaterialApp(
      title: title,
      initialRoute: "/signup",
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const Homepage(),
        '/signup': (BuildContext context) => const SignUpPage(),
      },
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headlineMedium!,
      child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Column(
            children: [
              const Text('Home Page'),
              const SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('signup/personal_info');
                },
                child: const SizedBox(
                  child: Text(
                    'Link: Signup Page',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'signup/personal_info',
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (context) => const Homepage();
            break;
          case 'signup/personal_info':
            // Assume CollectPersonalInfoPage collects personal info and then
            // navigates to 'signup/choose_credentials'.
            builder = (BuildContext context) => const CollectPersonalInfoPage();
            break;
          case 'signup/choose_credentials':
            // Assume ChooseCredentialsPage collects new credentials and then
// invokes 'onSignupComplete()'.
            builder = (BuildContext _) => ChooseCredentialsPage(
                  onSignupComplete: () {
                    // Referencing Navigator.of(context) from here refers to the
                    // top-level Navigator because SignUpPage is above the
                    // nested Navigator that it created. Therefore, this pop()
                    // will pop the entire "sign-up" journey and return to the
                    // "" route, AKA HomePage.
                    Navigator.of(context).pop();
                  },
                );
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}

class CollectPersonalInfoPage extends StatelessWidget {
  const CollectPersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headlineMedium!,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Name: Max, Address: Fury Road",
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                // This moves from the personal info page to the credentials page,
                // replacing this page with that one.
                Navigator.of(context).pushNamed('signup/choose_credentials');
              },
              child: const SizedBox(
                child: Text(
                  'Link: Credentials Page',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
              child: const SizedBox(
                child: Text(
                  'Link: HomePage',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      decoration: TextDecoration.underline),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChooseCredentialsPage extends StatelessWidget {
  final VoidCallback onSignupComplete;

  const ChooseCredentialsPage({
    super.key,
    required this.onSignupComplete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSignupComplete,
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.headlineMedium!,
        child: Container(
          color: Colors.pinkAccent,
          alignment: Alignment.center,
          child: const Text('Choose Credentials Page'),
        ),
      ),
    );
  }
}
