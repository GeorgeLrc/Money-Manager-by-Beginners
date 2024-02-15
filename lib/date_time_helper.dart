//convert DateTine object to a String yyymmdd
String convertDateTimeToString(DateTime dateTime){
  //year in the form of -> yyyy
  String year = dateTime.year.toString();
  //month in the format -> mm
  String month  = dateTime.month.toString();
  if(month.length == 1){
    month = '0$month';
  }
  //date in the format -> dd
  String day = dateTime.day.toString();
  if(day.length == 1){
    day = '0$day';
  }
  //final format of dateTime String
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}