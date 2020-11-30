package js.npm.stream_json.streamers;

import js.node.stream.Transform;
import js.npm.stream_chain.Chain;

/**
StreamObject assumes that a token stream represents an object and streams out its top-level properties as assembled JavaScript objects.
As every streamer, it assumes that individual objects can fit in memory, but the whole file, or any other source, should be streamed.

Warning: it cannot be used with a stream of objects produced by a JSON Streaming source, or Pick if it picks more than one object.
**/
@:jsRequire('stream-json/streamers/StreamObject')
extern class StreamObject extends StreamBase {
  function new (?options:StreamBase.StreamNewOptions);
  static function streamObject(?options:StreamBase.StreamNewOptions) : StreamObject;
  static function make(?options:StreamBase.StreamNewOptions) : StreamObject;
  static function withParser(?options:StreamBase.StreamNewOptions) : Chain;
}