package keeb;

// Disabled due to issues with Serializable
// Null safety features still used in methods
@:nullSafety(Off)
@:structInit
class AxisMapping implements hxbit.Serializable {
	/**
	 * The controller axis the mapping should apply to.
	 */
	@:s public var axis(default, null): GamepadAxis;
	/**
	 * The direction the mapping should apply to.
	 */
	@:s public var direction(default, null): AxisDirection;

    public var hashCode(get, never): Int;

	function get_hashCode(): Int {
		return (axis << 4) + direction;
	}
}
