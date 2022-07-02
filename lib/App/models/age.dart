class Identity {
  String yearOfBirth;
  int age = 0;
  Identity({required this.yearOfBirth});
  void calculateAge() {
    DateTime now = DateTime.now();
    int currentYear = now.year;
    age = currentYear - int.parse(yearOfBirth);
  }
}
