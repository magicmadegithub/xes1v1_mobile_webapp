class XesUtils {
  static String parseDateTimeYMD(String date) {
    DateTime parse = DateTime.parse(date);
    String year = parse.year.toString();
    String month = parse.month.toString();
    String day = parse.day.toString();
    String result = year + "年" + month + "月" + day + "日";
    return result;
  }
}
