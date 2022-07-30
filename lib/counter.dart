import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  final int initNumber;
  Function(int) counterCallback;
  Function increaseCallback;
  Function decreaseCallback;
  int minNumber;

  CounterView(
      {Key? key,
      required this.initNumber,
      required this.counterCallback,
      required this.increaseCallback,
      required this.decreaseCallback,
      required this.minNumber})
      : super(key: key);

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  late int _currentCount;
  late Function _counterCallback;
  late Function _increaseCallback;
  late Function _decreaseCallback;
  late int _minNumber;

  @override
  void initState() {
    _currentCount = widget.initNumber;
    _counterCallback = widget.counterCallback;
    _increaseCallback = widget.increaseCallback;
    _decreaseCallback = widget.decreaseCallback;
    _minNumber = widget.minNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0x3300bbaa),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _createIncrementDicrementButton(Icons.add, () => _increment()),
          Text(_currentCount.toString()),
          _createIncrementDicrementButton(Icons.remove, () => _dicrement()),
        ],
      ),
    );
  }

  void _increment() {
    setState(() {
      _currentCount++;
      _counterCallback(_currentCount);
      _increaseCallback();
    });
  }

  void _dicrement() {
    setState(() {
      if (_currentCount > _minNumber) {
        _currentCount--;
        _counterCallback(_currentCount);
        _decreaseCallback();
      }
    });
  }

  Widget _createIncrementDicrementButton(
      IconData icon, VoidCallback? onPressed) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: const BoxConstraints(minWidth: 90.0, minHeight: 45.0),
      onPressed: onPressed,
      elevation: 4.0,
      fillColor: const Color(0xff00bbaa),
      child: Icon(
        icon,
        color: Colors.black,
        size: 25.0,
      ),
      shape: const CircleBorder(),
    );
  }
}
