# Encoding APIs

`LeanCodec.Encoding` re-exports the four codec areas described below.

## Base64

Module: `LeanCodec/Encoding/Base64.lean`

Public API:

- `toBase64Bytes : ByteArray -> ByteArray`
- `fromBase64Bytes? : ByteArray -> Except String ByteArray`
- `toBase64 : ByteArray -> String`
- `fromBase64? : String -> Except String ByteArray`

Notes:

- Decoder enforces valid alphabet characters.
- Input length must be a multiple of 4.
- Padding is only accepted in the final quartet.
- Non-canonical padding bits are rejected.

## Generic Binary Typeclasses

Module: `LeanCodec/Encoding/Binary.lean`

Public API:

- `class ToBinary (α : Type)` with `toBinary : α -> ByteArray`
- `class FromBinary (α : Type)` with `fromBinary? : ByteArray -> Except String α`

Built-in instances:

- `ByteArray` identity encode/decode.
- `String` UTF-8 encode/decode (decode fails on invalid UTF-8).

## Lean Expr Binary Codec

Module: `LeanCodec/Encoding/Expr/Binary.lean`

Public API:

- `encodeExprRaw : Expr -> ByteArray`
- `decodeExprRaw? : ByteArray -> Except String Expr`
- `encodeExpr : Expr -> MetaM ByteArray`
- `decodeExpr? : ByteArray -> MetaM (Except String Expr)`

Notes:

- Wire format is versioned and begins with magic bytes.
- `decodeExpr?` validates free variable, metavariable, and universe metavariable references against the active `MetaM` context/state.

## Lean Meta Context/State Binary Codecs

Module: `LeanCodec/Encoding/Meta/Binary.lean`

Public API:

- `encodeMetaContext? : Meta.Context -> CoreM (Except String ByteArray)`
- `decodeMetaContext? : ByteArray -> CoreM (Except String Meta.Context)`
- `encodeMetaState : Meta.State -> CoreM ByteArray`
- `decodeMetaState? : ByteArray -> CoreM (Except String Meta.State)`

Notes:

- Wire format uses dedicated magic headers for context vs state payloads.
- Context encoding rejects `Meta.Context` values with `canUnfold?` set.
- Decode paths reject malformed payloads, version mismatch, and trailing data.
