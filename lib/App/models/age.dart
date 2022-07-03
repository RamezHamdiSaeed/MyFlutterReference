class Identity {
  String yearOfBirth;
  String age = '';
  Identity({required this.yearOfBirth}) {
    DateTime now = DateTime.now();
    int currentYear = now.year;
    age = (currentYear - int.parse(yearOfBirth)).toString();
  }
}
