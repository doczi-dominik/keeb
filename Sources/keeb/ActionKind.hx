package keeb;

enum ActionKind {
    /**
     * The `Action` is *active* the entire duration
     * the corresponding input is held. 
     * 
     * Useful for e.g.:
     * general movement and other continuous actions.
     */
    Hold;
    /**
     * The `Action` is *active* only on the first frame.
     * Useful for one-shot actions such as reloading a gun
     * or triggering a pause menu.
     */
    Press;
    /**
     * The `Action` acts like a `Press`, but if held down
     * longer than the `initialDelay`, then it will "repeat
     * a `Press`" every `rate` frames.
     * 
     * **Very** useful for menu navigation.
     * 
     * ---
     * 
     * Default values:
     * 
     * `rate`: **4 frames**
     * 
     * `initialDelay`: **20 frames**
     */
    Repeat(?rate: Int, ?initialDelay: Int);
}