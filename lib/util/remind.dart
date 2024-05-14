class remind {
  void printReminders() {
    final now = DateTime.now();
    final weekdayNames = ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日'];
    final weekday = weekdayNames[now.weekday - 1];

    final payDates = [
      DateTime(now.year, now.month, 15),
      DateTime(now.year, now.month, 20),
      DateTime(now.year, now.month, 25),
      DateTime(now.year, now.month, 30),
      DateTime(now.year, now.month + 1, 1),
      DateTime(now.year, now.month + 1, 5),
      DateTime(now.year, now.month + 1, 8),
      DateTime(now.year, now.month + 1, 10),
    ];

    final payDaysRemaining = payDates.map((date) {
      if (date.isBefore(now)) {
        date = DateTime(date.year, date.month + 1, date.day);
      }
      return date.difference(now).inDays + 1;
    }).toList();

    final nextSaturday = now.add(Duration(days: (6 - now.weekday + 1) % 7));
    final nextSunday = nextSaturday.add(Duration(days: 1));

    final doubleWeekend =
        now.weekday <= 5 ? nextSaturday : nextSaturday.add(Duration(days: 7));
    final singleWeekend =
        now.weekday <= 6 ? nextSunday : nextSunday.add(Duration(days: 7));

    final holidays = {
      '端午放假': DateTime(now.year, 6, 8),
      '中秋放假': DateTime(now.year, 9, 17),
      '国庆': DateTime(now.year, 10, 1),
      '2025年': DateTime(now.year + 1, 1, 1),
      '正月初一': DateTime(now.year + 1, 1, 29),
    };

    final holidayDaysRemaining = holidays
        .map((name, date) => MapEntry(name, date.difference(now).inDays + 1));

    DateTime targetDate = DateTime(now.year, 2, 18);
    final difference = -targetDate.difference(now).inDays;

    print('【摸鱼办】提醒您：');
    print(
        '今天是${now.year}年${now.month}月${now.day}日，$weekday。早上好，摸鱼人！即使今天是开工第${difference}天，也一定不要忘记摸鱼哦！有事没事起身去茶水间，去厕所，去廊道走走，别总在工位上坐着，钱是老板的，但健康是自己的。');
    print('温馨提示：');
    print('离【15号发工资】：${payDaysRemaining[0]}天');
    print('离【20号发工资】：${payDaysRemaining[1]}天');
    print('离【25号发工资】：${payDaysRemaining[2]}天');
    print('离【30号发工资】：${payDaysRemaining[3]}天');
    print('离【01号发工资】：${payDaysRemaining[4]}天');
    print('离【05号发工资】：${payDaysRemaining[5]}天');
    print('离【08号发工资】：${payDaysRemaining[6]}天');
    print('离【10号发工资】：${payDaysRemaining[7]}天');
    print('距离【双休周末】还有：${doubleWeekend.difference(now).inDays + 1}天');
    print('距离【单休周末】还有：${singleWeekend.difference(now).inDays + 1}天');
    holidayDaysRemaining.forEach((name, days) {
      print('距离【$name】还有：$days天');
    });
  }
}
