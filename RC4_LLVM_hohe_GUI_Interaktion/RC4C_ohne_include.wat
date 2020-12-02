(module
 (type $none_=>_none (func))
 (type $i32_=>_none (func (param i32)))
 (type $i32_i32_i32_i32_=>_none (func (param i32 i32 i32 i32)))
 (import "env" "memory" (memory $mimport$0 2))
 (import "env" "printToGUI" (func $printToGUI (param i32)))
 (table $0 1 1 funcref)
 (global $global$0 (mut i32) (i32.const 66560))
 (global $global$1 i32 (i32.const 1024))
 (global $global$2 i32 (i32.const 1024))
 (global $global$3 i32 (i32.const 1024))
 (global $global$4 i32 (i32.const 66560))
 (global $global$5 i32 (i32.const 0))
 (global $global$6 i32 (i32.const 1))
 (export "__wasm_call_ctors" (func $__wasm_call_ctors))
 (export "rc4" (func $rc4))
 (export "__dso_handle" (global $global$1))
 (export "__data_end" (global $global$2))
 (export "__global_base" (global $global$3))
 (export "__heap_base" (global $global$4))
 (export "__memory_base" (global $global$5))
 (export "__table_base" (global $global$6))
 (func $__wasm_call_ctors
 )
 (func $rc4 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (global.set $global$0
   (local.tee $4
    (i32.sub
     (global.get $global$0)
     (i32.const 1024)
    )
   )
  )
  (local.set $5
   (i32.const 0)
  )
  (local.set $6
   (local.get $4)
  )
  (loop $label$1
   (i32.store
    (local.get $6)
    (local.get $5)
   )
   (local.set $6
    (i32.add
     (local.get $6)
     (i32.const 4)
    )
   )
   (br_if $label$1
    (i32.ne
     (local.tee $5
      (i32.add
       (local.get $5)
       (i32.const 1)
      )
     )
     (i32.const 256)
    )
   )
  )
  (local.set $6
   (i32.const 0)
  )
  (local.set $5
   (local.get $4)
  )
  (local.set $7
   (i32.const 0)
  )
  (loop $label$2
   (i32.store
    (local.get $5)
    (i32.load
     (local.tee $9
      (i32.add
       (local.get $4)
       (i32.shl
        (local.tee $7
         (i32.rem_s
          (i32.add
           (i32.add
            (local.tee $8
             (i32.load
              (local.get $5)
             )
            )
            (local.get $7)
           )
           (i32.load
            (i32.add
             (local.get $0)
             (i32.shl
              (i32.rem_s
               (local.get $6)
               (local.get $1)
              )
              (i32.const 2)
             )
            )
           )
          )
          (i32.const 256)
         )
        )
        (i32.const 2)
       )
      )
     )
    )
   )
   (i32.store
    (local.get $9)
    (local.get $8)
   )
   (local.set $5
    (i32.add
     (local.get $5)
     (i32.const 4)
    )
   )
   (br_if $label$2
    (i32.ne
     (local.tee $6
      (i32.add
       (local.get $6)
       (i32.const 1)
      )
     )
     (i32.const 256)
    )
   )
  )
  (block $label$3
   (br_if $label$3
    (i32.lt_s
     (local.get $3)
     (i32.const 1)
    )
   )
   (local.set $7
    (i32.const 0)
   )
   (local.set $8
    (i32.const 0)
   )
   (loop $label$4
    (i32.store
     (local.tee $5
      (i32.add
       (local.get $4)
       (i32.shl
        (local.tee $8
         (i32.rem_s
          (i32.add
           (local.get $8)
           (i32.const 1)
          )
          (i32.const 256)
         )
        )
        (i32.const 2)
       )
      )
     )
     (i32.load
      (local.tee $9
       (i32.add
        (local.get $4)
        (i32.shl
         (local.tee $7
          (i32.rem_s
           (i32.add
            (local.tee $6
             (i32.load
              (local.get $5)
             )
            )
            (local.get $7)
           )
           (i32.const 256)
          )
         )
         (i32.const 2)
        )
       )
      )
     )
    )
    (i32.store
     (local.get $9)
     (local.get $6)
    )
    (call $printToGUI
     (i32.xor
      (i32.load
       (i32.add
        (local.get $4)
        (i32.shl
         (i32.rem_s
          (i32.add
           (local.get $6)
           (i32.load
            (local.get $5)
           )
          )
          (i32.const 256)
         )
         (i32.const 2)
        )
       )
      )
      (i32.load
       (local.get $2)
      )
     )
    )
    (local.set $2
     (i32.add
      (local.get $2)
      (i32.const 4)
     )
    )
    (br_if $label$4
     (local.tee $3
      (i32.add
       (local.get $3)
       (i32.const -1)
      )
     )
    )
   )
  )
  (global.set $global$0
   (i32.add
    (local.get $4)
    (i32.const 1024)
   )
  )
 )
 ;; custom section "producers", size 112
)

