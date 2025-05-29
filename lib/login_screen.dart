import 'package:flutter/material.dart';
import 'chat_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: "Enter your username"),
            ),
            ElevatedButton(
              onPressed: () {
                final username = _controller.text.trim();
                if (username.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(username: username),
                    ),
                  );
                }
              },
              child: const Text("Enter Chat"),
            ),
          ],
        ),
      ),
    );
  }
}
