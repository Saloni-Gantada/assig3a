import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Details App',
      theme: ThemeData(
      primarySwatch: Colors.yellow,
      ),
      home: const UserDetailsPage(),
    );
  }
}

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController rollNoController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: rollNoController,
              decoration: const InputDecoration(labelText: 'Roll No'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Show Details'),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DisplayDetailsPage(
                      name: nameController.text,
                      email: emailController.text,
                      rollNo: rollNoController.text,
                      phoneNumber: phoneNumberController.text,
                    ),
                  ),
                );


                if (result) {
                  // ignore: use_build_context_synchronously
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Logout'),
                      content: Text('User ${nameController.text} Logged out'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayDetailsPage extends StatelessWidget {
  final String name;
  final String email;
  final String rollNo;
  final String phoneNumber;

  const DisplayDetailsPage({super.key, 
    required this.name,
    required this.email,
    required this.rollNo,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Name: $name'),
            Text('Email: $email'),
            Text('Roll No: $rollNo'),
            Text('Phone Number: $phoneNumber'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}