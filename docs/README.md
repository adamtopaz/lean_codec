# LeanCodec Documentation

LeanCodec provides standalone encoding/decoding utilities that complement `lean_worker`.

## Quick Start

```bash
lake build
lake exe run_tests
```

## Documentation Index

- `docs/encoding.md`: API and behavior notes for base64, binary, `Expr`, and `Meta` codecs.

## Project Pointers

- Library root export: `LeanCodec.lean`
- Encoding umbrella module: `LeanCodec/Encoding.lean`
- Test runner: `LeanCodecTest/Main.lean`
