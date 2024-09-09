package keeb;

/**
 * Represents the direction to map for an `AxisMapping`.
 */
enum abstract AxisDirection(Int) to Int {
    /**
     * The *positive* direction: **right** on the *X-axis* and **down** on the *Y-axis*.
     */
    final Positive = 1;
    /**
     * The *negative* direction: **left** on the *X-axis* and **up** on the *Y-axis*.
     */
    final Negative = -1;
}