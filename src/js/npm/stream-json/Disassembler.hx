package js.npm.stream_json;

import haxe.extern.EitherType;
import js.node.stream.Transform;

typedef ReplacerFunction = (val1:Any, val2:Any) -> Any;
typedef ReplaceArray = Array<EitherType<String, Number>>;

typedef DisassemblerNewOptions = {
  > ParserNewOptions,
  var ?replacer:EitherType<ReplacerFunction, ReplaceArray>;
}

/**
Disassembler receives a stream of JavaScript objects and produces a token stream.

Disassembler is a Transform stream, which operates in object mode.
It doesn't have any special public properties nor methods.
In general, it was modeled on Parser.
**/
@:jsRequire('stream-json/Disassembler')
extern class Disassembler extends Transform<Disassembler> {
  /**
  As Parser it supports all packing and streaming options described in Parser's constructor options.
  **/
  function new(?options:DisassemblerNewOptions);
  static function make(?options:DisassemblerNewOptions):Disassembler;
  static function disassembler(?options:DisassemblerNewOptions):Disassembler;
}
