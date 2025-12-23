import 'package:alphareality/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat UI',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: false,
      ),

      // REMOVE BLUE GLOW
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: child!,
        );
      },
      home: const ChatScreen(),
    );
  }
}

/// REMOVE BLUE OVERSCROLL GLOW
class NoGlowBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            // LOGO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                child: FittedBox(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 98,
                    width: 270,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 4),

            // TITLE
            const Text(
              "Customer Support",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 30),

            // CHAT CONTAINER
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 25,
                      spreadRadius: 5,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: const AssetImage('assets/chat_bg.png'),
                        fit: BoxFit.cover,
                        repeat: ImageRepeat.repeat,
                        colorFilter: ColorFilter.mode(
                          Colors.white70,
                          BlendMode.srcATop,
                        ),
                      ),
                    ),
                    child: const _ChatBody(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      /// BOTTOM NAVIGATION
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}

class _ChatBody extends StatefulWidget {
  const _ChatBody();

  @override
  State<_ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<_ChatBody> {
  final TextEditingController _controller = TextEditingController();

  final List<_Message> _messages = [
    _Message(
      text: 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.',
      time: '10:52',
      isMe: false,
    ),
    _Message(
      text: 'Lorem ipsum dolor sit amet,',
      time: '10:53',
      isMe: true,
    ),
    _Message(
      text: 'Lorem ipsum dolor',
      time: '10:53',
      isMe: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),

        // DATE LABEL
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Today',
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        // MESSAGES
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return _ChatBubble(message: _messages[index]);
            },
          ),
        ),

        const SizedBox(height: 4),

        // INPUT BAR
        _InputBar(
          controller: _controller,
          onSend: () {
            final text = _controller.text.trim();
            if (text.isEmpty) return;

            setState(() {
              _messages.add(
                _Message(
                  text: text,
                  time: _formatTime(),
                  isMe: true,
                ),
              );
            });

            _controller.clear();
          },
        ),

        const SizedBox(height: 10),
      ],
    );
  }

  String _formatTime() {
    final now = TimeOfDay.now();
    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }
}

class _Message {
  final String text;
  final String time;
  final bool isMe;

  const _Message({
    required this.text,
    required this.time,
    required this.isMe,
  });
}

class _ChatBubble extends StatelessWidget {
  final _Message message;

  const _ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              constraints:
                  BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: isMe ? const Color(0xFF10C45C) : const Color(0xFFF4F5F7),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(18),
                  topRight: const Radius.circular(18),
                  bottomLeft: Radius.circular(isMe ? 18 : 4),
                  bottomRight: Radius.circular(isMe ? 4 : 18),
                ),
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  fontSize: 13,
                  color: isMe ? Colors.white : Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 3),
            Text(
              message.time,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const _InputBar({
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          // MIC BUTTON
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 12,
                  spreadRadius: 1,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.mic_none_rounded,
                color: Color(0xFF10C45C), size: 26),
          ),

          const SizedBox(width: 10),

          // INPUT FIELD
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Write now...",
                        hintStyle: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onSend,
                    child: const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(Icons.send_rounded,
                          color: Colors.green, size: 22),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
