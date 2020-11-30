package externs.npm.streamjson;

import js.node.stream.Transform;
import js.node.stream.Transform.TransformNewOptions;

typedef ParserNewOptions = {
  > TransformNewOptions,
  
  /**
  packValues serves as the initial value for packing strings, numbers, and keys.
  **/
  var ?packValues:Bool;
  
  /**
  packKeys specifies, if we need to pack keys and send them as a value.
  **/
  var ?packKeys:Bool;
  
  /**
  packStrings specifies, if we need to pack strings and send them as a value.
  **/
  var ?packStrings:Bool;
  
  /**
  packNumbers specifies, if we need to pack numbers and send them as a value.
  **/
  var ?packNumbers:Bool;
  
  /**
  streamValues serves as the initial value for other three options described above.
  **/
  var ?streamValues:Bool;
  
  /**
  streamKeys specifies, if we need to send items related to unpacked keys.
  **/
  var ?streamKeys:Bool;
  
  /**
  streamStrings specifies, if we need to send items related to unpacked strings.
  **/
  var ?streamStrings:Bool;
  
  /**
  streamNumbers specifies, if we need to send items related to unpacked numbers.
  **/
  var ?streamNumbers:Bool;
  
  /**
  jsonStreaming controls the parsing algorithm.
  If true, a stream of JSON objects is parsed as described in JSON Streaming as "Concatenated JSON".
  Technically it will recognize "Line delimited JSON" AKA "JSON Lines" AKA JSONL as well.
  Otherwise, it will follow the JSON standard assuming a singular value.
  **/
  var ?jsonStreaming:Bool;
}

/**
  This is the workhorse of the package.
  It is a Transform stream, which consumes text, and produces a stream of data items corresponding to high-level tokens. 
  It is always the first in a pipe chain being directly fed with a text from a file, a socket, the standard input, or any other text stream.
Its Writable part operates in a buffer/text mode, while its Readable part operates in an objectMode.
**/
@:jsRequire('stream-json/Parser')
extern class Parser extends Transform<Parser> {
  function new(?options:ParserNewOptions);
  static function make(?options:ParserNewOptions):Parser;
  static function parser(?options:ParserNewOptions):Parser;
}
