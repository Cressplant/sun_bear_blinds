import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';

class DarkModeSwitch extends StatefulWidget {
  final bool value;
  final Function(bool value) onChanged;

  DarkModeSwitch({required this.value, required this.onChanged});

  @override
  _DarkModeSwitchState createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  String _animation = 'day_idle';
  bool _value = false;

  @override
  void initState() {
    _value = widget.value;
    _animation = _value ? 'night_idle' : 'day_idle';
    super.initState();
  }

  Future<void> _onChanged(bool _newValue) async {
    widget.onChanged(_newValue);

    setState(() {
      _value = _newValue;
      _animation = _newValue ? 'switch_night' : 'switch_day';
    });

    await Future.delayed(Duration(milliseconds: 500));

    setState(() {
      _animation = _newValue ? 'night_idle' : 'day_idle';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _onChanged(!_value),
        child: Container(
          margin: EdgeInsets.all(10.0),
          height: 30,
          width: 55,
          // color: Colors.red,
          child: FlareActor(
            'assets/animations/dark_mode_switch.flr',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: _animation,
            // isPaused: true,
            // controller: FlareControls()
          ),
        ),
      ),
    );
  }
}
