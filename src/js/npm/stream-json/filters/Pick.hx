package js.npm.stream_json.filters;

import js.node.stream.Transform;
import js.npm.stream_chain.Chain;

/**
Pick is a token item filter based on FilterBase.
It selects objects from a stream ignoring the rest.
Its filter is not called for subobjects of selected objects.
Unless Pick selects just one object, it produces a stream of objects similar to JSON Streaming supported by Parser. Usually, the result is piped through StreamValues.
All other streamers will be unsuitable.
**/
@:jsRequire('stream-json/filters/Pick')
extern class Pick extends FilterBase {
  function new (?options:FilterBase.FilterNewOptions);
  static function pick(?options:FilterBase.FilterNewOptions) : Pick;
  static function make(?options:FilterBase.FilterNewOptions) : Pick;

  /**
  It returns a stream produced by stream-chain, which wraps the pipeline.
  The most important utility of withParser() is that it correctly sets object modes of the returned stream: object mode for the Readable part and text mode for the Writable part.
  
  This static method is created using withParser() utility.
  It simplifies a case when a stream should be immediately preceded by a parser.
  **/
  static function withParser(?options:FilterBase.FilterNewOptions) : Chain;
}