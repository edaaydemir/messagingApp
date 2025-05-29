import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'message_bubble.dart';

class ChatScreen extends StatelessWidget {
  final String username;
  final TextEditingController _messageController = TextEditingController();

  ChatScreen({required this.username});

  void sendMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      FirebaseFirestore.instance.collection('messages').add({
        'text': message,
        'createdAt': Timestamp.now(),
        'username': username,
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light background
      appBar: AppBar(
        title: Text('Chat - $username'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .orderBy('createdAt', descending: false)
                  .snapshots(),
              builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

                final docs = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (ctx, index) {
                    final data = docs[index];
                    final isMe = data['username'] == username;

                    return MessageBubble(
                      username: data['username'],
                      text: data['text'],
                      isMe: isMe,
                    );
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: Colors.grey),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                      hintStyle: TextStyle(color: Colors.black54),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blueAccent),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
