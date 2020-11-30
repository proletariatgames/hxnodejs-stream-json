package js.npm.stream_json.filters;

import js.node.stream.Transform;
import js.npm.stream_chain.Chain;

/**
Replace is a token item filter based on FilterBase.
It replaces objects from a stream passing the rest as is.

Its filter is not called for subobjects of replaced objects.
In certain conditions, it can replace items with nothing effectively ignoring values.

There is a helper filter Ignore, which is used to remove values completely.
It is based on Replace.
**/
@:jsRequire('stream-json/filters/Replace')
extern class Replace extends FilterBase {
  function new(?options:FilterBase.FilterNewOptions);
  static function replace(?options:FilterBase.FilterNewOptions):Replace;
  static function make(?options:FilterBase.FilterNewOptions):Replace;
  
  /**
  It returns a stream produced by stream-chain, which wraps the pipeline.
  The most important utility of withParser() is that it correctly sets object modes of the returned stream: object mode for the Readable part and text mode for the Writable part.
  
  This static method is created using withParser() utility.
  It simplifies a case when a stream should be immediately preceded by a parser.
  **/
  static function withParser(?options:FilterBase.FilterNewOptions):Chain;
}
