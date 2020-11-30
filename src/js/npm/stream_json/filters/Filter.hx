package js.npm.stream_json.filters;

import js.node.stream.Transform;
import js.npm.stream_chain.Chain;

/**
Filter is a token item filter based on FilterBase.
It selects objects from a stream ignoring the rest.
Its filter is called for all value tokens.
A shape of incoming stream is preserved: when selecting a subobject, all parent objects will be recreated to keep a stream valid.
**/
@:jsRequire('stream-json/filters/Filter')
extern class Filter extends FilterBase {
  function new(?options:FilterBase.FilterNewOptions);
  static function filter(?options:FilterBase.FilterNewOptions):Filter;
  static function make(?options:FilterBase.FilterNewOptions):Filter;
  
  /**
  It returns a stream produced by stream-chain, which wraps the pipeline.
  The most important utility of withParser() is that it correctly sets object modes of the returned stream: object mode for the Readable part and text mode for the Writable part.
  
  This static method is created using withParser() utility.
  It simplifies a case when a stream should be immediately preceded by a parser.
  **/
  static function withParser(?options:FilterBase.FilterNewOptions):Chain;
}
