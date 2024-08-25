class MenuItem {
  final String imagePath;
  final String label;

  MenuItem(this.imagePath, this.label);
}

final List<MenuItem> menuItems = [
  MenuItem('assets/images/svg/electricity.svg', 'Electricity'),
  MenuItem('assets/images/svg/internet.svg', 'Internet'),
  MenuItem('assets/images/svg/voucher.svg', 'Voucher'),
  MenuItem('assets/images/svg/assurance.svg', 'Assurance'),
  MenuItem('assets/images/svg/merchant.svg', 'Merchant'),
  MenuItem('assets/images/svg/mobile_credit.svg', 'Mobile Credit'),
  MenuItem('assets/images/svg/bill.svg', 'Bill'),
  MenuItem('assets/images/svg/more.svg', 'More'),
];

class NotificationItem {
  final String imagePath;
  final String title;
  final String time;
  final String tag;

  NotificationItem(this.imagePath, this.title, this.time, this.tag);
}

final List<NotificationItem> notificationItems = [
  NotificationItem(
    'assets/images/png/y1.png',
    'Daily Cashback',
    '8.00 AM',
    'Promo',
  ),
  NotificationItem(
    'assets/images/png/y2.png',
    'Use BLCK10 Promo Code',
    '3:40 PM',
    'Promo',
  ),
  NotificationItem(
    'assets/images/png/y3.png',
    'Cyber Monday Deal',
    '10:39 AM',
    'Promo',
  ),
  NotificationItem(
    'assets/images/png/y4.png',
    '\$250 top up successfully\nadded',
    '6:14 PM',
    'Info',
  ),
  NotificationItem(
    'assets/images/png/y5.png',
    'Use NOV10 Promo Code',
    '3:40 PM',
    'Promo',
  ),
  NotificationItem(
    'assets/images/png/y6.png',
    '30% Black Friday Deal',
    '3:40 PM',
    'Promo',
  ),
];

List<Map<String, dynamic>> recentExpenses = [
  {
    'name': 'Starbucks Coffee',
    'amount': -156.00,
    'date': 'Dec 2, 2020',
    'time': '3:09 PM',
    'icon': 'assets/images/png/starbucks.png'
  },
  {
    'name': 'Netflix Subscription',
    'amount': -87.00,
    'date': 'Dec 11, 2020',
    'time': '10:02 AM',
    'icon': 'assets/images/png/netflix.png'
  },
];

class CreditCard {
  final String cardName;
  final String cardNumber;

  CreditCard({
    required this.cardName,
    required this.cardNumber,
  });
}

final List<CreditCard> creditCards = [
  CreditCard(
    cardName: 'Wally Virtual Card',
    cardNumber: '0318-1608-2105',
  ),
  CreditCard(
    cardName: 'Solulab Platinum Card',
    cardNumber: '5123-4567-8901-2345',
  ),
  CreditCard(
    cardName: 'Flutter Dev Gold Card',
    cardNumber: '9876-5432-1098-7654',
  ),
];
