package js.npm.stream_json.streamers;

import js.node.stream.Transform;
import js.npm.stream_chain.Chain;

/**
StreamArray assumes that an input token stream represents an array of objects and streams out assembled JavaScript objects:
As every streamer, it assumes that individual objects can fit in memory, but the whole file, or any other source, should be streamed.

Warning: it cannot be used with a stream of objects produced by a JSON Streaming source, or Pick if it picks more than one object.
**/
@:jsRequire('stream-json/streamers/StreamArray')
extern class StreamArray extends StreamBase {
  function new (?options:StreamBase.StreamNewOptions);
  static function streamArray(?options:StreamBase.StreamNewOptions) : StreamArray;
  static function make(?options:StreamBase.StreamNewOptions) : StreamArray;
  static function withParser(?options:StreamBase.StreamNewOptions) : Chain;
}