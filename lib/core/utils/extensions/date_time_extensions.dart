import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  static List months = [
  '',
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
  ];



  get days {
    return  [
    '',
    'Sat',
    'Sun',
    'Mon',
    'Tues',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
    'Mon',
    'Tues',
    'Wed',
    'Thu',
    'Fri',

    ];
  }

  int firstWeekDayOfMonth(){
    return  DateTime(this.year , this.month ,1).weekday;
  }

   String printMonth(){
    return months[this.month];
  }

  String printDayOFWeek(){
    return days[this.weekday];
  }

  String printDateTime(){
    return DateFormat('yyyy-MM-dd hh:mm a').format(this);
  }

  String printTime(){
    return DateFormat('hh:mm a').format(this);
  }

   DateTime nextDay( ) {
    return DateTime(this.year, this.month , this.day+1 ,this.hour , this.minute , this.second);
  }

  DateTime addMonth( int m) {
    return DateTime(this.year, this.month +m, this.day);
  }

  DateTime setMonth( int m) {
    return DateTime(this.year,  m, this.day);
  }
  DateTime setDay( int d) {
    return DateTime(this.year,  this.month, d);
  }

  bool isSameDate( DateTime date) {
    return this.day == date.day && this.month == date.month && this.year == date.year ;
  }

  DateTime AddHours( int h) {
    return DateTime(this.year, this.month  , this.day ,this.hour+h);
  }

  List<List<DateTime?>> getWeeks(){
    List<List<DateTime?>> weeks=[];
    List<DateTime?> week=[];
    for(int i = 0 ; i <this.daysInMonth ; i++){

      if(i%7 ==0 && i>=7){
        weeks.add(week);
        week=[];
      }
      week.add(this.setDay(i+1));
    }
    weeks.add(week);
    for(int i=week.length ; i<7 ; i++){
      week.add(null);
    }
    return weeks;
  }



  int getRemainingMonthCount(  ) {
    return 12 - this.month ;
  }

  int get daysInMonth => daysPerMonth(year)[month - 1];


  static List<int> daysPerMonth(int year) => <int>[
    31,
    _isLeapYear(year) ? 29 : 28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31,
  ];

  int get weekOfYear {
    // Add 3 to always compare with January 4th, which is always in week 1
    // Add 7 to index weeks starting with 1 instead of 0
    final woy = ((ordinalDate - weekday + 10) ~/ 7);

    // If the week number equals zero, it means that the given date belongs to the preceding (week-based) year.
    if (woy == 0) {
      // The 28th of December is always in the last week of the year
      return DateTime(year - 1, 12, 28).weekOfYear;
    }

    // If the week number equals 53, one must check that the date is not actually in week 1 of the following year
    if (woy == 53 &&
        DateTime(year, 1, 1).weekday != DateTime.thursday &&
        DateTime(year, 12, 31).weekday != DateTime.thursday) {
      return 1;
    }

    return woy;
  }


  int get ordinalDate {
    const offsets = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
    return offsets[month - 1] + day + (isLeapYear && month > 2 ? 1 : 0);
  }


  bool get isLeapYear {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
  }
  static bool _isLeapYear(int year) {
    return (year & 3) == 0 && ((year % 25) != 0 || (year & 15) == 0);
  }
}