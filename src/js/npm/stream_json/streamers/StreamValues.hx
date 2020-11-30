package js.npm.stream_json.streamers;

import js.node.stream.Transform;
import js.npm.stream_chain.Chain;

/**
StreamValues assumes that a token stream represents subsequent values and stream them out one by one.
StreamValues is a usual companion for Pick, which streams selected subobjects individually.

As every streamer, it assumes that individual objects can fit in memory, but the whole file, or any other source, should be streamed.
**/
@:jsRequire('stream-json/streamers/StreamValues')
extern class StreamValues  extends StreamBase {
  function new (?options:StreamBase.StreamNewOptions);
  static function streamValues(?options:StreamBase.StreamNewOptions) : StreamValues;
  static function make(?options:StreamBase.StreamNewOptions) : StreamValues;
  static function withParser(?options:StreamBase.StreamNewOptions) : Chain;
}