package keeb;

import kha.System;
import kha.input.KeyCode;
import kha.input.Keyboard;

using Safety;

class KeyboardInput<ActionName: String = keeb.ActionName> extends Input<ActionName> {
    final keysToActions: Map<KeyCode, Array<ActionName>>;

    public function new(config: InputConfig<ActionName>) {
        super(Keyboard, config);

        keysToActions = [];

        for (name => action in config) {
            final keys = action.keys;

            if (keys == null) {
                continue;
            }
            
            for (key in keys) {
                final actionList = keysToActions.get(key);

                if (actionList == null) {
                    keysToActions.set(key, [name]);
                } else {
                    actionList.push(name);
                }
            }
        }
    }

    function tryInitialize() {
        final kb = Keyboard.get();

        if (kb == null) {
            return;
        }

        kb.notify(downListener, upListener);
        initialized = true;
    }

    function downListener(key: KeyCode) {
        anythingDownCounter++;
        
        final actions = keysToActions?.get(key);
        
        if (actions == null) {
            return;
        }

        for (action in actions) {
            counters[action] = 0;
        }
    }

    function upListener(key: KeyCode) {
        if (anythingDownCounter > 0) {
            anythingDownCounter--;
        }

        final actions = keysToActions?.get(key);
        
        if (actions == null) {
            return;
        }

        for (action in actions) {
            counters.remove(action);
        }
        
    }
}