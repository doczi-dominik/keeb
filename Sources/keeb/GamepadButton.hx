package keeb;

/**
 * The buttons of a *DualShock 4* gamepad.
 */
enum abstract GamepadButton(Int) from Int to Int {
	final Cross;
	final Circle;
	final Square;
	final Triangle;
	final L1;
	final R1;
	final L2;
	final R2;
	final Share;
	final Options;
	final L3;
	final R3;
	final DPadUp;
	final DPadDown;
	final DPadLeft;
	final DPadRight;
}
