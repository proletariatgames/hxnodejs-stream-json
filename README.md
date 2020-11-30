# Haxe/hxnodejs externs for the [stream-json](https://www.npmjs.com/package/stream-json) npm library

Tested using `stream-json` version **"1.0.1"**

Example:
```haxe
import haxe.Json;
import js.node.Fs;
import js.npm.stream_json.Parser;
import js.npm.stream_json.streamers.StreamArray;

final file = 'my_file.json';

final chain = Chain.make([
  Fs.createReadStream(file),
  Parser.make(),
  StreamArray.make()
]);

chain.on('error', (data) -> {
  trace(Json.stringify(data));
});
```
