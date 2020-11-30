package js.npm.stream_json;

import haxe.extern.EitherType;
import js.node.stream.Writable;

/**
Emitter is a Writable stream operating in object mode.
It consumes a token stream and emits tokens as events on itself.
Essentially it is an object version of emit().
**/
@:jsRequire('stream-json/Emitter')
extern class Emitter extends Writable<Emitter> {
  function new(?options:WritableNewOptions);
  static function make(?options:WritableNewOptions):Emitter;
  static function emitter(?options:WritableNewOptions):Emitter;
}
