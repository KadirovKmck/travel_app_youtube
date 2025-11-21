import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scaffold_plus/scaffold_plus.dart';

const _kBlue = Color(0xFF007AFF);
const _kLightBlue = Color(0xFFE5F2FF);
const _kBgInput = Color(0xFFF5F5F7);
const _kTitle = Color(0xFF111111);
const _kSubtitle = Color(0xFF9496A1);

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = <_ChatItem>[
      _ChatItem(
        name: 'Sajib  Rahman',
        lastMessage: 'Hi, John! 👋 How are you doing?',
        time: '09:15',
        status: _MessageStatus.read,
        statusDotColor: Colors.green,
      ),
      _ChatItem(
        name: 'Adom Shafi',
        lastMessage: 'Typing...',
        time: '08:42',
        status: _MessageStatus.delivered,
        statusDotColor: const Color(0xFFFFC93C),
        isTyping: true,
      ),
      _ChatItem(
        name: 'HR Rumen',
        lastMessage: 'You: Cool! 😄 Let’s meet at 18:00 near the traveling!',
        time: 'Yesterday',
        status: _MessageStatus.read,
        statusDotColor: Colors.green,
      ),
      _ChatItem(
        name: 'Anjelina',
        lastMessage: 'You: Hey, will you come to the party on Saturday?',
        time: '07:56',
        status: _MessageStatus.sent,
        statusDotColor: Colors.red,
      ),
      _ChatItem(
        name: 'Alexa Shorna',
        lastMessage: 'Thank you for coming! Your or...',
        time: '05:52',
        status: _MessageStatus.none,
        statusDotColor: const Color(0xFF8E8E93),
      ),
    ];

    return ScaffoldPlus(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const _CircleIconButton(icon: Icons.arrow_back_ios_new_rounded),
                const Spacer(),
                const Text(
                  'Messages',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: _kTitle,
                  ),
                ),
                const Spacer(),
                const _CircleIconButton(icon: Icons.more_horiz_rounded),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            child: Row(
              children: [
                const Text(
                  'Messages',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: _kTitle,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE5E5EA)),
                  ),
                  child: const Icon(
                    Icons.edit_outlined,
                    size: 20,
                    color: _kTitle,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _SearchField(),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              itemCount: chats.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 24, thickness: 0.5),
              itemBuilder: (context, index) {
                final chat = chats[index];
                return _ChatTile(
                  item: chat,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ChatPage(chat: chat)),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// ---------------------- ПОМОЩНИКИ ДЛЯ СПИСКА ЧАТОВ ----------

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: _kBlue,
      decoration: InputDecoration(
        hintText: 'Search for chats & messages',
        hintStyle: const TextStyle(fontSize: 15, color: _kSubtitle),
        prefixIcon: const Icon(Icons.search_rounded, size: 22),
        filled: true,
        fillColor: _kBgInput,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _ChatItem {
  final String name;
  final String lastMessage;
  final String time;
  final Color statusDotColor;
  final _MessageStatus status;
  final bool isTyping;

  const _ChatItem({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.statusDotColor,
    this.status = _MessageStatus.none,
    this.isTyping = false,
  });
}

enum _MessageStatus { none, sent, delivered, read }

class _ChatTile extends StatelessWidget {
  final _ChatItem item;
  final VoidCallback? onTap;

  const _ChatTile({required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    final subtitleColor = item.isTyping ? _kBlue : _kSubtitle;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _AvatarWithStatus(color: item.statusDotColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: _kTitle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      item.time,
                      style: const TextStyle(fontSize: 12, color: _kSubtitle),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13, color: subtitleColor),
                      ),
                    ),
                    const SizedBox(width: 6),
                    buildMessageStatusIcon(item.status),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildMessageStatusIcon(_MessageStatus status) {
  switch (status) {
    case _MessageStatus.sent:
      return const Icon(Icons.check_rounded, size: 16, color: _kSubtitle);
    case _MessageStatus.delivered:
      return const Icon(Icons.done_all_rounded, size: 16, color: _kSubtitle);
    case _MessageStatus.read:
      return const Icon(Icons.done_all_rounded, size: 16, color: _kBlue);
    case _MessageStatus.none:
      return const SizedBox.shrink();
  }
}

class _AvatarWithStatus extends StatelessWidget {
  final Color color;

  const _AvatarWithStatus({required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 26,
          backgroundColor: Color(0xFFE5E5EA),
          child: Icon(Icons.person, size: 28, color: _kTitle),
        ),
        Positioned(
          bottom: 2,
          right: 2,
          child: Container(
            height: 14,
            width: 14,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            child: Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ),
        ),
      ],
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _CircleIconButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _kBgInput,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          height: 36,
          width: 36,
          child: Icon(icon, size: 18, color: _kTitle),
        ),
      ),
    );
  }
}

/// ---------------------- ЭКРАН ОДНОГО ЧАТА -------------------

class ChatPage extends StatelessWidget {
  final _ChatItem chat;

  const ChatPage({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    final messages = <_Message>[
      const _Message(
        text: 'Hello!',
        time: '9:24',
        isMe: true,
        status: _MessageStatus.read,
      ),
      const _Message(
        text:
            'Thank you very mouch for your traveling, we really like the apartments. we will stay here for anather 5 days...',
        time: '9:30',
        isMe: false,
      ),
      const _Message(text: 'Hello! 👋', time: '9:34', isMe: false),
      const _Message(
        text: 'I’m very glab you like it👍',
        time: '9:35',
        isMe: false,
      ),
      const _Message(
        text: 'We are arriving today at 01:45, will someone be at home?',
        time: '9:37',
        isMe: false,
      ),
      const _Message(
        text: 'I will be at home',
        time: '9:39',
        isMe: true,
        status: _MessageStatus.read,
      ),
    ];

    return ScaffoldPlus(
      backgroundColor: Colors.white,
      appBar: _buildChatAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: messages.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildTodayChip();
                }
                final message = messages[index - 1];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: _ChatBubble(message: message),
                );
              },
            ),
          ),
          const _ChatInput(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildChatAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leadingWidth: 72,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: _CircleIconButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      centerTitle: true,
      title: Column(
        children: [
          Text(
            chat.name,
            style: const TextStyle(
              color: _kTitle,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Active Now',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF34C759),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: _CircleIconButton(icon: Icons.call_outlined),
        ),
      ],
    );
  }

  Widget _buildTodayChip() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, top: 4),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: _kBgInput,
            borderRadius: BorderRadius.circular(999),
          ),
          child: const Text(
            'Today',
            style: TextStyle(
              fontSize: 11,
              color: _kSubtitle,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

/// ---------------------- БАДЛЫ ЧАТА --------------------------

class _Message {
  final String text;
  final String time;
  final bool isMe;
  final _MessageStatus status;

  const _Message({
    required this.text,
    required this.time,
    required this.isMe,
    this.status = _MessageStatus.none,
  });
}

class _ChatBubble extends StatelessWidget {
  final _Message message;

  const _ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final align = message.isMe ? Alignment.centerRight : Alignment.centerLeft;
    final bubbleColor = message.isMe ? _kLightBlue : Colors.white;
    final radius = BorderRadius.only(
      topLeft: const Radius.circular(20),
      topRight: const Radius.circular(20),
      bottomLeft: Radius.circular(message.isMe ? 20 : 4),
      bottomRight: Radius.circular(message.isMe ? 4 : 20),
    );

    return Align(
      alignment: align,
      child: Column(
        crossAxisAlignment: message.isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(color: bubbleColor, borderRadius: radius),
            child: Text(
              message.text,
              style: const TextStyle(fontSize: 15, color: _kTitle),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message.time,
                style: const TextStyle(fontSize: 11, color: _kSubtitle),
              ),
              if (message.isMe) ...[
                const SizedBox(width: 4),
                buildMessageStatusIcon(message.status),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _ChatInput extends StatelessWidget {
  const _ChatInput();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: _kBgInput,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const TextField(
                  minLines: 1,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Type you message',
                    hintStyle: TextStyle(fontSize: 15, color: _kSubtitle),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.insert_emoticon_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.mic_none_rounded),
              onPressed: () {},
            ),
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: _kBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.send_rounded,
                size: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
