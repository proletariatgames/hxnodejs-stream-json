package js.npm.stream_json.utils;

import js.node.stream.Writable;
import js.node.stream.Writable.WritableNewOptions;
import js.npm.stream_chain.Chain;

typedef VerifierNewOptions = {
  > WritableNewOptions,

  var jsonStreaming? : Bool;
}

/**
This utility is a Writable stream.
It is based on Parser, but its only purpose is to raise an error with an exact location (offset, line, position) when its input is not a valid JSON.
Use it to troubleshoot when Parser fails to parse.
**/
@:jsRequire('stream-json/utils/Verifier')
extern class Verifier extends Writable<Verifier> {
  function new(?options:VerifierNewOptions);
  static function make(?options:VerifierNewOptions):Verifier;
  static function parser(?options:VerifierNewOptions):Verifier;
}
