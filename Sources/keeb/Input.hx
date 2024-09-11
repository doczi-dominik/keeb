package keeb;

import keeb.exceptions.NullActionKind;

abstract class Input<A: String = ActionName> {
    static final instances = new Array<Input<Dynamic>>();

    public static function update() {
        for (i in instances) {
            if (!i.initialized) {
                i.tryInitialize();
            }
            
            i.updateInstance();
        }
    }

    final counters = new Map<A, Int>();
    final actionToFilter: Map<A, Int -> Bool>;

    var anythingDownCounter: Int;
    var initialized: Bool;

    public final kind: InputDeviceKind;
    public final config: InputConfig<A>;

    public var isAnythingDown(get, never): Bool;
    
    function get_isAnythingDown() {
        return anythingDownCounter > 0;
    }

    function new(kind: InputDeviceKind, config: InputConfig<A>) {
        this.kind = kind;
        this.config = config;

        anythingDownCounter = 0;
        initialized = false;

        actionToFilter = [];

        for (actionName => action in config) {
            final filter = switch (action.kind) {
                case null:
                    #if debug
                    throw new NullActionKind(action, config);
                    #else
                    continue;
                    #end
                
                case Press:
                    pressActionFilter;

                case Hold:
                    holdActionFilter;

                case Repeat(rate, initialDelay):
                    rate = rate ?? 4;
                    initialDelay = initialDelay ?? 20;

                    repeatActionFilter.bind(rate, initialDelay);
            }

            actionToFilter[actionName] = filter;
        }

        instances.push(this);
    }

    abstract function tryInitialize(): Void;

    final function updateInstance() {
        for (action => value in counters) {
            counters[action] = value + 1;
        }
    }

    final function holdActionFilter(_: Int) {
        return true;
    }

    // Input.update() generally runs at the
    // beginning of the loop, making the first
    // observable counter value 1
    final function pressActionFilter(value: Int) {
        return value == 1;
    }

    final function repeatActionFilter(rate: Int, delay: Int, value: Int) {
        if (value < delay) {
            return pressActionFilter(value);
        }

        return value % rate == 0;
    }

    public final function isActive(action: A): Bool {
        final filter = actionToFilter.get(action);

        if (filter == null) {
            return false;
        }

        final counterValue = counters.get(action);

        if (counterValue == null) {
            return false;
        }

        return filter(counterValue);
    }

    public final function isActiveRaw(action: A): Bool {
        final counterValue = counters.get(action);

        if (counterValue == null) {
            return false;
        }

        return true;
    }
}