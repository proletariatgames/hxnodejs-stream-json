package js.npm.stream_json.streamers;

import js.node.stream.Transform;
import js.node.stream.Transform.TransformNewOptions;

typedef ObjectFilterFunction = (asm:Assembler) -> Null<Bool>;

typedef StreamNewOptions = {
  > TransformNewOptions,
  
  /**
  objectFilter is an optional function.
  - If specified, it is used to inspect incomplete objects as they are being assembled.
  - It is called in the context of a streamer with one argument: an internal Assembler instance.
  - A filter function can return three values:
    = Truthy. This response means that we should include this object in an output stream.
      The object will be assembled from an input stream without further checks.
    = false. This response means that we should not output this object.
      A partially assembled object will be discarded, and the rest of the object will be ignored without further checks.
    = Anything else (usually undefined) signifies that the filter has not enough information to make a decision,
      the next token should be processed, and the filter will be called again on the same object.
  - If not specified (the default), all objects are going to be included in an output stream.
  **/
  var ?objectFilter:ObjectFilterFunction;
  
  /**
  includeUndecided is a flag.
  It controls how to handle objects, which were not decided one way or another.
  - If it is truthy, an undecided object (already fully assembled) will be included in the output.
  - Otherwise (the default), an undecided object will be discarded.
  **/
  var ?includeUndecided:Bool;
}

/**
All provided streamers use StreamBase as its foundation.
It is a base class meant to be extended, which provides common facilities used by streamers.

StreamBase is based on Transform.
It operates in object mode consuming a token stream produced by a parser or filters, which will be transformed into a stream of partially assembled JavaScript objects.
**/
@:jsRequire('stream-json/streamers/StreamBase')
extern class StreamBase extends Transform<StreamBase> {
  function new(?options:StreamNewOptions);
}
