package js.npm.stream_json.filters;

import haxe.extern.EitherType;
import js.node.stream.Transform;
import js.node.stream.Transform.TransformNewOptions;

typedef FilterFunction = (stack:Stack, token:Token) -> Bool;
typedef ReplacementFunction = (stack:Stack, token:Token) -> Array<Token>;
typedef Stack = Array<Null<EitherType<Int, String>>>;

interface Token {
  var name:String;
  var value:Null<EitherType<String, Bool>>;
}

typedef FilterNewOptions = {
  > TransformNewOptions,
  
  /**
  filter is a way to accept or reject a data item.
  The interpretation of its returned value is up to concrete filter objects.
  Its value can be one of the following types:
  - String. The stack is converted to a string using pathSeparator, then it should be equal to filter value, or it should be longer and the filter value should be on a boundary of the pathSeparator value.
  - RegExp. The stack is converted to a string using pathSeparator, then the filter is applied using filter.test(path).
  - Function. The filter is applied using filter(stack, chunk), where chunk is a data item being filtered. The function is called in the context of current filter object. It should return a truthy/falsy value.
    **/
  var filter:EitherType<EitherType<String, EReg>, FilterFunction>;
  
  /**
  once is a flag.
  When it is truthy, a filter object will make a selection (depending on its definition of selection) only once. Otherwise, all selections are included.
  The default: false.
  **/
  var ?once:Bool;
  
  /**
  pathSeparator is a string that separates stack values when it is converted to a string. The algorithm is straightforward: stack.join(pathSeparator).
  The default: '.'.
  **/
  var ?pathSeparator:String;
  
  /**
  replacement is what should be used instead of skipped objects. Not all filters use this option. Its value can be one of the following types:
  - Function. The filter is applied using replacement(stack, chunk), where chunk is a data item being filtered. The function is called in the context of current filter object. It should return an array of semantically valid data items.
  - Otherwise, it is assumed to be a static array of semantically valid data items.
  **/
  var ?replacement:EitherType<Array<Token>, ReplacementFunction>;
  
  /**
  allowEmptyReplacement is a flag.
  It explicitly allows or disallows to replace removed values with an empty array.
  - The problem is that when streaming an object, a key will be already streamed, then a filter may want to remove a corresponding value (replace it with an empty array), which produces an invalid JSON stream. In order to avoid it, when allowEmptyReplacement is falsy, a filter checks the length of a replacement array and replaces it with the default (usually the null data item) if it is empty.
  - If a source stream packs keys, the problem can be avoided by delaying streaming keys. When allowEmptyReplacement is true, a filter will use this algorithm to stream keys.
  **/
  var ?allowEmptyReplacement:Bool;

  var ?streamValues:Bool;
  var ?streamKeys:Bool;
}

/**
All provided filters use FilterBase as its foundation.
It is a base class meant to be extended, which provides common facilities used by filters.

FilterBase is based on Transform.
It operates in object mode editing token streams produced by a parser or another filter.
Generally, filters go after a parser or other filters.
It is possible to chain filters to achieve a desirable effect.
**/
@:jsRequire('stream-json/filters/FilterBase')
extern class FilterBase extends Transform<FilterBase> {
  function new(?options:Dynamic);
}
