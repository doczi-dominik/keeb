package keeb.exceptions;

import haxe.Exception;

class NullActionKind<A: String = keeb.ActionName> extends Exception {
    public function new(action: Action, ic: InputConfig<A>) {
        super('Null ActionKind for Action $action. InputConfig was: $ic');
    }
}