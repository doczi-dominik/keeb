package keeb;

enum abstract InputDeviceKind(String) {
    final Keyboard;
    final Gamepad;
    final Any;
    final Null;
    final Multi;
}