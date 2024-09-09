package keeb;

import kha.input.KeyCode;
import hxbit.Serializable;

import kha.input.Gamepad;

// Disabled due to issues with Serializable
// Null safety features still used in methods
@:nullSafety(Off)
@:structInit
class Action implements Serializable {
	/**
	 * Describes what kind of `Action` this represents
	 * regarding input behavior.
	 */
	@:s
	public var kind(default, null): ActionKind;
	
	/**
	 * The keyboard keys that can trigger this `Action`.
	 */
	@:s
	@:optional
	public var keys(default, null): Null<Array<KeyCode>>;

	/**
	 * The gamepad buttons that can trigger this `Action`.
	 */
	@:s
	@:optional
	public var buttons(default, null): Null<Array<GamepadButton>>;
	
	/**
	 * The gamepad axes that can trigger this `Action`.
	 * On a regular gamepad, axes generally include the left/right control sticks
	 * and the left/right triggers.
	 */
	@:s
	@:optional
	public var axes(default, null): Null<Array<AxisMapping>>;

	/**
	 * A short description of what this `Action` represents in-game.
	 * Useful for input config menus!
	 */
	@:s
	@:optional
	public var title(default, null): Null<String>;

	/**
	 * A longer description of what this `Action` represents in the game world.
	 * Every element of the array should be a line of the description text.
	 * Useful for displaying in input config menus / help pages!
	 */
	@:s
	@:optional
	public var description(default, null): Null<Array<String>>;

	function toString() {
		return '{ kind: $kind, keys: $keys, btns: $buttons, axes: $axes }';
	}
}