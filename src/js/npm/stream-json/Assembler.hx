package js.npm.stream_json;

import haxe.extern.EitherType;
import js.node.events.EventEmitter;
import js.node.stream.Readable;

interface Token {
  var name:String;
  var value:Null<String>;
}

/**
Assembler receives a token stream and assembles JavaScript objects.
It is used as a building block for streamers.
**/
@:jsRequire('stream-json/Assembler')
extern class Assembler extends EventEmitter<Assembler> {
  /**
  The current object being assembled.
  If it is an array, new subobjects will be added to it.
  If it is an object, new properties will be added to it.
  Otherwise, it can be one of this: a string, a number, null, true, false.
  **/
  var current:Any;
  
  /**
  A string for a property key, or null, if unused.
  This variable is used to keep a property name until a corresponding subobject is assembled.
  **/
  var key:Null<String>;
  
  /**
  An array of parent objects for an object in current.
  This array is used as a stack. Even values correspond to parent objects, while odd values contain a property key or null.
  Essentially, when a new object comes in the current values of current and key are pushed on stack and reinitialized.
  When current is fully assembled, it is placed in its parent object possibly using key, and old values of current and key are restored from stack.
  **/
  var stack:Array<Null<EitherType<String, Float>>>;
  
  /**
  It is a boolean flag.
  It indicates that a current object is fully assembled.
  When this flag flips to true an event called done is issued as well.
  In the case of a stream of multiple JSON objects, done can be flipped to true multiple times.
  **/
  var done(default, null):Bool;
  
  /**
  This getter returns a current object depth.
  It is 0 for top-level objects.
  For example, for [{a: 1}] when assembling 1, the depth will be 2.
  **/
  var depth(default, null):Int;
  
  /**
  This getter calculates and returns an array similar to FilterBase's stack.
  For example, for [{a: 1}] when assembling 1, the path will be [0, 'a'].
  **/
  var path(default, null):String;
  
  function new();
  
  /**
  This is a helper method, which encapsulates a common pattern used to consume a token.
  It returns the instance for possible chaining.
  **/
  function consume(chunk:Token):Assembler;
  
  /**
  This method attaches to a token stream to run consume() cycle on data event.
  Additionally, after consuming a token, if done property is true, done event is emitted with the Assembler instance as a payload. It returns the instance for possible chaining.
  **/
  function connectTo(stream:IReadable):Assembler;
  
  /**
  This method discards subobjects until we hit a depth indicated by level.
  It is assumed that the current depth is higher than a requested level.
  Otherwise, no actions are performed. It returns the instance for possible chaining.
  **/
  function dropToLevel(level:Float):Assembler;
  
  /**
  This static method creates an Assembler instance, connects it to a token stream, and returns the instance.
  **/
  static function connectTo(stream:Stream):Assembler;
}
