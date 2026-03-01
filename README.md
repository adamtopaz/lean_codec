# LeanCodec

Lean 4 codecs for base64 and binary payloads, including codecs for Lean `Expr` and `Meta.Context`/`Meta.State` values.

This project hosts the encoding/decoding pieces that were split out of `lean_worker`, so `lean_worker` can stay focused on JSON-RPC server/client runtime concerns.

## Features

- RFC4648-style base64 encode/decode with strict padding and canonical-bit checks.
- Generic `ToBinary`/`FromBinary` typeclasses with `ByteArray` and `String` instances.
- Binary codec for Lean `Expr` with wire header/versioning and reference validation.
- Binary codec for Lean `Meta.Context` and `Meta.State` with semantic round-trip coverage.

## Module Layout

- `LeanCodec/Encoding/Base64.lean`: base64 conversions.
- `LeanCodec/Encoding/Binary.lean`: `ToBinary`/`FromBinary` core typeclasses.
- `LeanCodec/Encoding/Expr/Binary.lean`: Lean `Expr` binary codec.
- `LeanCodec/Encoding/Meta/Binary.lean`: Lean `Meta.Context`/`Meta.State` binary codecs.
- `LeanCodec/Encoding.lean`: umbrella export for encoding modules.

## Build

```bash
lake build
```

## Tests

```bash
lake exe run_tests
```

The test runner lives in `LeanCodecTest/Main.lean` and covers base64, generic binary instances, expression codec behavior, and meta context/state behavior.

## Quick Examples

```lean
open LeanCodec.Encoding

def asText : String := toBase64 "hello".toUTF8
#eval fromBase64? asText
```

```lean
open LeanCodec.Encoding

def bytes : ByteArray := toBinary "hello utf8"
#eval fromBinary? (α := String) bytes
```

## Docs

See `docs/README.md` for a short docs index and API notes.
