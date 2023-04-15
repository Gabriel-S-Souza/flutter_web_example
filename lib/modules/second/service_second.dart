class ServiceSecond {
  int count = 0;
  String get message => 'Service Second | $count';
  void increment() => count++;
  void decrement() => count--;
}
