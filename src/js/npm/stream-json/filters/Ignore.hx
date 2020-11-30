package js.npm.stream_json.filters;

import js.node.stream.Transform;
import js.npm.stream_chain.Chain;

/**
Ignore is a token item filter based on Replace, which is used to remove values completely.
**/
@:jsRequire('stream-json/filters/Ignore')
extern class Ignore extends FilterBase {
  function new(?options:FilterBase.FilterNewOptions);
  static function ignore(?options:FilterBase.FilterNewOptions):Ignore;
  static function make(?options:FilterBase.FilterNewOptions):Ignore;

  /**
  It returns a stream produced by stream-chain, which wraps the pipeline.
  The most important utility of withParser() is that it correctly sets object modes of the returned stream: object mode for the Readable part and text mode for the Writable part.
  
  This static method is created using withParser() utility.
  It simplifies a case when a stream should be immediately preceded by a parser.
  **/
  static function withParser(?options:FilterBase.FilterNewOptions):Chain;
}
