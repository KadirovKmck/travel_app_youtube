import 'package:flutter/material.dart';
import 'package:scaffold_plus/scaffold_plus.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    const orange = Color(0xFFFF5A1F);
    const textColor = Color(0xFF111111);
    const subtitleColor = Color(0xFF8E8E93);

    final notifications = <_NotificationItem>[
      _NotificationItem(
        title: 'Super Offer',
        subtitle: 'Get 60% off in our first booking',
        time: 'Sun,12:40pm',
        avatar: 'assets/images/1.png',
        avatarBg: const Color(0xFFFFF1BF),
        rowBg: const Color(0xFFE7F4FF),
      ),
      _NotificationItem(
        title: 'Super Offer',
        subtitle: 'Get 60% off in our first booking',
        time: 'Mon,11:50pm',
        avatar: 'assets/images/2.png',
        avatarBg: const Color(0xFFE5F3FF),
      ),
      _NotificationItem(
        title: 'Super Offer',
        subtitle: 'Get 60% off in our first booking',
        time: 'Tue,10:56pm',
        avatar: 'assets/images/3.png',
        avatarBg: const Color(0xFFE7FFE3),
      ),
      _NotificationItem(
        title: 'Super Offer',
        subtitle: 'Get 60% off in our first booking',
        time: 'Wed,12:40pm',
        avatar: 'assets/images/4.png',
        avatarBg: const Color(0xFFFFE7F0),
      ),
      _NotificationItem(
        title: 'Super Offer',
        subtitle: 'Get 60% off in our first booking',
        time: 'Fri,11:50pm',
        avatar: 'assets/images/5.png',
        avatarBg: const Color(0xFFFFE4E4),
      ),
      _NotificationItem(
        title: 'Super Offer',
        subtitle: 'Get 60% off in our first booking',
        time: 'Sat,10:56pm',
        avatar: 'assets/images/6.png',
        avatarBg: const Color(0xFFE6EBFF),
      ),
    ];
    return ScaffoldPlus(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Notification',
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: InkWell(
            borderRadius: BorderRadius.circular(999),
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF6F6F8),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 18,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Clear all',
              style: TextStyle(
                color: orange,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              color: Colors.white,
              child: const TabBar(
                labelColor: orange,
                unselectedLabelColor: Color(0xFF8E8E93),
                indicatorColor: orange,
                indicatorWeight: 2.5,
                tabs: [
                  Tab(text: 'Recent'),
                  Tab(text: 'Earlier'),
                  Tab(text: 'Archived'),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFFE5E5E5)),
            Expanded(
              child: Container(
                color: Colors.white,
                child: TabBarView(
                  children: [
                    // Recent
                    _NotificationList(
                      items: notifications,
                      textColor: textColor,
                      subtitleColor: subtitleColor,
                    ),
                    _NotificationList(
                      items: notifications,
                      textColor: textColor,
                      subtitleColor: subtitleColor,
                    ),
                    _NotificationList(
                      items: notifications,
                      textColor: textColor,
                      subtitleColor: subtitleColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationList extends StatelessWidget {
  final List<_NotificationItem> items;
  final Color textColor;
  final Color subtitleColor;

  const _NotificationList({
    required this.items,
    required this.textColor,
    required this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      separatorBuilder: (_, __) =>
          const Divider(height: 1, color: Color(0xFFE5E5E5)),
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          color: item.rowBg ?? Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: item.avatarBg,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(item.avatar, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: subtitleColor, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                item.time,
                textAlign: TextAlign.right,
                style: const TextStyle(color: Color(0xFF8E8E93), fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NotificationItem {
  final String title;
  final String subtitle;
  final String time;
  final String avatar;
  final Color avatarBg;
  final Color? rowBg;

  _NotificationItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.avatar,
    required this.avatarBg,
    this.rowBg,
  });
}
