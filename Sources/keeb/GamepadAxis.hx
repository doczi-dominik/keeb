package keeb;

/**
 * The different analog outputs of a *DualShock 4* gamepad.
 */
enum abstract GamepadAxis(Int) to Int {
    final LeftStickX;
    final LeftStickY;
    final L2;
    final R2;
    final RightStickX;
    final RightStickY; 
}