package js.npm.stream_json;

import haxe.extern.EitherType;
import js.node.stream.Transform;

typedef StringerNewOptions = {
  > TransformNewOptions,
  var ?useValues: Bool;
  var ?useKeyValues: Bool;
  var ?useStringValues: Bool;
  var ?useNumberValues: Bool;
  var ?makeArray: Bool;
}

/**
Stringer is a Transform stream.
It consumes a stream of JavaScript objects and converts it to a JSONL (AKA NDJSON) file.
It is very useful when you want to edit a stream with filters and custom code, and save it back to a file.
**/
@:jsRequire('stream-json/Stringer')
extern class Stringer extends Transform<Stringer> {
  function new(?options:StringerNewOptions);
  static function make(?options:StringerNewOptions):Emitter;
  static function stringer(?options:StringerNewOptions):Emitter;
}
