package keeb.exceptions;

import haxe.ds.GenericStack;
import haxe.Exception;

class NoSuchAction extends Exception {
    public function new(name: ActionName, player: PlayerID, ic: GenericStack<InputConfig>) {
        super('No Action named \'$name\' for PlayerID \'$player\'. InputConfigStack was: $ic');
    }
}