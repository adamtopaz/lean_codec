module

public import LeanCodecTest.Tests.Support
public import LeanCodecTest.Tests.Encoding

public section

def main : IO Unit := do
  LeanCodecTest.runTest "base64 known vectors" LeanCodecTest.testBase64KnownVectors
  LeanCodecTest.runTest "base64 binary round trip" LeanCodecTest.testBase64BinaryRoundTrip
  LeanCodecTest.runTest "base64 invalid inputs" LeanCodecTest.testBase64InvalidInputs
  LeanCodecTest.runTest "base64 canonical padding" LeanCodecTest.testBase64NonCanonicalPaddingBits
  LeanCodecTest.runTest "binary bytearray instances" LeanCodecTest.testToFromBinaryByteArray
  LeanCodecTest.runTest "binary string instances" LeanCodecTest.testToFromBinaryString
  LeanCodecTest.runTest "binary invalid utf8" LeanCodecTest.testFromBinaryStringInvalidUtf8
  LeanCodecTest.runTest "expr binary round trip" LeanCodecTest.testExprBinaryRoundTrip
  LeanCodecTest.runTest "expr binary init env types" LeanCodecTest.testExprBinaryRoundTripInitEnvTypes
  LeanCodecTest.runTest "expr binary init env values" LeanCodecTest.testExprBinaryRoundTripInitEnvValues
  LeanCodecTest.runTest "expr binary unknown fvar" LeanCodecTest.testExprBinaryDecodeUnknownFVar
  LeanCodecTest.runTest "expr binary unknown mvar" LeanCodecTest.testExprBinaryDecodeUnknownMVar
  LeanCodecTest.runTest "expr binary unknown lmvar" LeanCodecTest.testExprBinaryDecodeUnknownLMVar
  LeanCodecTest.runTest "expr binary invalid magic" LeanCodecTest.testExprBinaryInvalidMagic
  LeanCodecTest.runTest "expr binary invalid version" LeanCodecTest.testExprBinaryInvalidVersion
  LeanCodecTest.runTest "expr binary invalid tag" LeanCodecTest.testExprBinaryInvalidTag
  LeanCodecTest.runTest "expr binary trailing data" LeanCodecTest.testExprBinaryTrailingData
  LeanCodecTest.runTest "meta context/state semantic round trip" LeanCodecTest.testMetaContextStateSemanticRoundTrip
  LeanCodecTest.runTest "meta context rejects canUnfold" LeanCodecTest.testMetaContextEncodeRejectsCanUnfold
  LeanCodecTest.runTest "meta context invalid magic" LeanCodecTest.testMetaContextInvalidMagic
  LeanCodecTest.runTest "meta state invalid magic" LeanCodecTest.testMetaStateInvalidMagic
