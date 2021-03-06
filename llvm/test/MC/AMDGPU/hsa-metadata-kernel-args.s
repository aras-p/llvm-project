// RUN: llvm-mc -triple=amdgcn-amd-amdhsa -mcpu=gfx700 -mattr=-code-object-v3 -show-encoding %s | FileCheck --check-prefix=CHECK --check-prefix=GFX700 %s
// RUN: llvm-mc -triple=amdgcn-amd-amdhsa -mcpu=gfx800 -mattr=-code-object-v3 -show-encoding %s | FileCheck --check-prefix=CHECK --check-prefix=GFX800 %s
// RUN: llvm-mc -triple=amdgcn-amd-amdhsa -mcpu=gfx900 -mattr=-code-object-v3 -show-encoding %s | FileCheck --check-prefix=CHECK --check-prefix=GFX900 %s

// CHECK:  .amd_amdgpu_hsa_metadata
// CHECK:    Version: [ 1, 0 ]
// CHECK:    Printf:
// CHECK:      - '1:1:4:%d\n'
// CHECK:      - '2:1:8:%g\n'
// CHECK:    Kernels:
// CHECK:      - Name:            test_kernel
// CHECK:        SymbolName:      'test_kernel@kd'
// CHECK:        Language:        OpenCL C
// CHECK:        LanguageVersion: [ 2, 0 ]
// CHECK:        Args:
// CHECK:          - TypeName:      char
// CHECK:            Size:          1
// CHECK:            Align:         1
// CHECK:            ValueKind:     ByValue
// CHECK:            ValueType:     I8
// CHECK:            AccQual:       Default
// CHECK:          - Size:          8
// CHECK:            Align:         8
// CHECK:            ValueKind:     HiddenGlobalOffsetX
// CHECK:            ValueType:     I64
// CHECK:          - Size:          8
// CHECK:            Align:         8
// CHECK:            ValueKind:     HiddenGlobalOffsetY
// CHECK:            ValueType:     I64
// CHECK:          - Size:          8
// CHECK:            Align:         8
// CHECK:            ValueKind:     HiddenGlobalOffsetZ
// CHECK:            ValueType:     I64
// CHECK:          - Size:          8
// CHECK:            Align:         8
// CHECK:            ValueKind:     HiddenPrintfBuffer
// CHECK:            ValueType:     I8
// CHECK:            AddrSpaceQual: Global
// CHECK:  .end_amd_amdgpu_hsa_metadata
.amd_amdgpu_hsa_metadata
  Version: [ 1, 0 ]
  Printf: [ '1:1:4:%d\n', '2:1:8:%g\n' ]
  Kernels:
    - Name:            test_kernel
      SymbolName:      test_kernel@kd
      Language:        OpenCL C
      LanguageVersion: [ 2, 0 ]
      Args:
        - TypeName:      char
          Size:          1
          Align:         1
          ValueKind:     ByValue
          ValueType:     I8
          AccQual:       Default
        - Size:          8
          Align:         8
          ValueKind:     HiddenGlobalOffsetX
          ValueType:     I64
        - Size:          8
          Align:         8
          ValueKind:     HiddenGlobalOffsetY
          ValueType:     I64
        - Size:          8
          Align:         8
          ValueKind:     HiddenGlobalOffsetZ
          ValueType:     I64
        - Size:          8
          Align:         8
          ValueKind:     HiddenPrintfBuffer
          ValueType:     I8
          AddrSpaceQual: Global
.end_amd_amdgpu_hsa_metadata
