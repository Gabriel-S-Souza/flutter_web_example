class ServiceGlobal {
  int count = 0;
  String get message => 'Service Global | $count';
  void increment() => count++;
}
