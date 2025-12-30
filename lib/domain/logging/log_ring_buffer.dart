class LogRingBuffer<T> {
  final int capacity;
  final List<T?> _buffer;

  int _writeIndex = 0;
  int _count = 0;

  LogRingBuffer(this.capacity) : _buffer = List<T?>.filled(capacity, null);

  void add(T item) {
    _buffer[_writeIndex] = item;
    _writeIndex = (_writeIndex + 1) % capacity;
    if (_count < capacity) _count++;
  }

  Iterable<T> get values sync* {
    final start = (_writeIndex - _count + capacity) % capacity;
    for (int i = 0; i < _count; i++) {
      yield _buffer[(start + i) % capacity]!;
    }
  }

  int get length => _count;
}
