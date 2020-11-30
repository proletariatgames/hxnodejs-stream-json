package js.npm.stream_json.utils;

import js.node.stream.Transform;
import js.node.stream.Transform.TransformNewOptions;
import js.npm.stream_chain.Chain;

typedef BatchNewOptions = {
  > TransformNewOptions,
  /**
  The size of each batch. Defaults to 1000. Ignored
  if not a positive number.
  **/
  var batchSize ? : Int;
}

/**
This utility is a Transform stream.
It operates in object mode accepting items and packing them into an array.
As soon as the array is big enough (a configurable value) it is emitted as an output.
All arrays as big as specified but the last one can be smaller but never empty.
**/
@:jsRequire('stream-json/utils/Batch')
extern class Batch extends Transform<Batch> {
  function new(?options:BatchNewOptions);
  static function batch(?options:BatchNewOptions):Batch;
  static function make(?options:BatchNewOptions):Batch;
  static function withParser(?options:BatchNewOptions):Chain;
}
