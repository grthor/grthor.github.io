(module
 (type $none_=>_i32 (func (result i32)))
 (type $none_=>_none (func))
 (type $i32_=>_none (func (param i32)))
 (type $i32_i32_i32_i32_i32_=>_none (func (param i32 i32 i32 i32 i32)))
 (type $i32_=>_i32 (func (param i32) (result i32)))
 (memory $0 256 32768)
 (table $0 2 2 funcref)
 (elem (i32.const 1) $0)
 (global $global$0 (mut i32) (i32.const 5243920))
 (global $global$1 i32 (i32.const 1028))
 (export "memory" (memory $0))
 (export "__indirect_function_table" (table $0))
 (export "rc4" (func $1))
 (export "_initialize" (func $0))
 (export "__errno_location" (func $5))
 (export "stackSave" (func $2))
 (export "stackRestore" (func $3))
 (export "stackAlloc" (func $4))
 (export "__data_end" (global $global$1))
 (func $0
  (nop)
 )
 (func $1 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (global.set $global$0
   (local.tee $7
    (i32.sub
     (global.get $global$0)
     (i32.const 1024)
    )
   )
  )
  (loop $label$1
   (i32.store
    (i32.add
     (local.get $7)
     (i32.shl
      (local.get $5)
      (i32.const 2)
     )
    )
    (local.get $5)
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
  (local.set $5
   (i32.const 0)
  )
  (loop $label$2
   (i32.store
    (local.tee $8
     (i32.add
      (local.get $7)
      (i32.shl
       (local.get $6)
       (i32.const 2)
      )
     )
    )
    (i32.load
     (local.tee $9
      (i32.add
       (local.get $7)
       (i32.shl
        (local.tee $5
         (i32.rem_s
          (i32.add
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
           (i32.add
            (local.tee $8
             (i32.load
              (local.get $8)
             )
            )
            (local.get $5)
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
  (local.set $6
   (i32.const 0)
  )
  (if
   (i32.gt_s
    (local.get $3)
    (i32.const 0)
   )
   (block
    (local.set $1
     (i32.const 0)
    )
    (local.set $0
     (i32.const 0)
    )
    (loop $label$4
     (i32.store
      (local.tee $5
       (i32.add
        (local.get $7)
        (i32.shl
         (local.tee $0
          (i32.rem_s
           (i32.add
            (local.get $0)
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
         (local.get $7)
         (i32.shl
          (local.tee $1
           (i32.rem_s
            (i32.add
             (local.tee $8
              (i32.load
               (local.get $5)
              )
             )
             (local.get $1)
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
     (i32.store
      (i32.add
       (local.get $4)
       (local.tee $9
        (i32.shl
         (local.get $6)
         (i32.const 2)
        )
       )
      )
      (i32.xor
       (i32.load
        (i32.add
         (local.get $7)
         (i32.shl
          (i32.rem_s
           (i32.add
            (local.get $8)
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
        (i32.add
         (local.get $2)
         (local.get $9)
        )
       )
      )
     )
     (br_if $label$4
      (i32.ne
       (local.tee $6
        (i32.add
         (local.get $6)
         (i32.const 1)
        )
       )
       (local.get $3)
      )
     )
    )
   )
  )
  (global.set $global$0
   (i32.add
    (local.get $7)
    (i32.const 1024)
   )
  )
 )
 (func $2 (result i32)
  (global.get $global$0)
 )
 (func $3 (param $0 i32)
  (global.set $global$0
   (local.get $0)
  )
 )
 (func $4 (param $0 i32) (result i32)
  (global.set $global$0
   (local.tee $0
    (i32.and
     (i32.sub
      (global.get $global$0)
      (local.get $0)
     )
     (i32.const -16)
    )
   )
  )
  (local.get $0)
 )
 (func $5 (result i32)
  (i32.const 1024)
 )
)

