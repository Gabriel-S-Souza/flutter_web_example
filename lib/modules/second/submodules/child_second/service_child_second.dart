class ServiceChildSecond {
  String _message = 'Service ChildSecond';
  int count = 0;
  String get message => 'Service ChildSecond | $count | $_message';
  void setMessage(String value) => _message = value;
  void increment() => count++;
}
