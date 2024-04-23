{

    function allocate_unbounded() -> memPtr {
        memPtr := mload(64)
    }

    function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
        revert(0, 0)
    }

    function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
        revert(0, 0)
    }

    function cleanup_t_bytes4(value) -> cleaned {
        cleaned := and(value, 0xffffffff00000000000000000000000000000000000000000000000000000000)
    }

    function validator_revert_t_bytes4(value) {
        if iszero(eq(value, cleanup_t_bytes4(value))) { revert(0, 0) }
    }

    function abi_decode_t_bytes4(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_bytes4(value)
    }

    function abi_decode_tuple_t_bytes4(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_bytes4(add(headStart, offset), dataEnd)
        }

    }

    function cleanup_t_bool(value) -> cleaned {
        cleaned := iszero(iszero(value))
    }

    function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
        mstore(pos, cleanup_t_bool(value))
    }

    function abi_encode_tuple_t_bool__to_t_bool__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

    }

    function array_length_t_string_memory_ptr(value) -> length {

        length := mload(value)

    }

    function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function copy_memory_to_memory_with_cleanup(src, dst, length) {

        mcopy(dst, src, length)
        mstore(add(dst, length), 0)

    }

    function round_up_to_mul_of_32(value) -> result {
        result := and(add(value, 31), not(31))
    }

    function abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value, pos) -> end {
        let length := array_length_t_string_memory_ptr(value)
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length)
        copy_memory_to_memory_with_cleanup(add(value, 0x20), pos, length)
        end := add(pos, round_up_to_mul_of_32(length))
    }

    function abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value0,  tail)

    }

    function cleanup_t_uint256(value) -> cleaned {
        cleaned := value
    }

    function validator_revert_t_uint256(value) {
        if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
    }

    function abi_decode_t_uint256(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_uint256(value)
    }

    function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function cleanup_t_uint160(value) -> cleaned {
        cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
    }

    function cleanup_t_address(value) -> cleaned {
        cleaned := cleanup_t_uint160(value)
    }

    function abi_encode_t_address_to_t_address_fromStack(value, pos) {
        mstore(pos, cleanup_t_address(value))
    }

    function abi_encode_tuple_t_address__to_t_address__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

    }

    function validator_revert_t_address(value) {
        if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
    }

    function abi_decode_t_address(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_address(value)
    }

    function abi_decode_tuple_t_addresst_uint256(headStart, dataEnd) -> value0, value1 {
        if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
        mstore(pos, cleanup_t_uint256(value))
    }

    function abi_encode_tuple_t_uint256__to_t_uint256__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

    }

    function abi_decode_tuple_t_addresst_addresst_uint256(headStart, dataEnd) -> value0, value1, value2 {
        if slt(sub(dataEnd, headStart), 96) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 64

            value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

    }

    function identity(value) -> ret {
        ret := value
    }

    function convert_t_uint160_to_t_uint160(value) -> converted {
        converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
    }

    function convert_t_uint160_to_t_address(value) -> converted {
        converted := convert_t_uint160_to_t_uint160(value)
    }

    function convert_t_contract$_IERC20_$362_to_t_address(value) -> converted {
        converted := convert_t_uint160_to_t_address(value)
    }

    function abi_encode_t_contract$_IERC20_$362_to_t_address_fromStack(value, pos) {
        mstore(pos, convert_t_contract$_IERC20_$362_to_t_address(value))
    }

    function abi_encode_tuple_t_contract$_IERC20_$362__to_t_address__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_contract$_IERC20_$362_to_t_address_fromStack(value0,  add(headStart, 0))

    }

    function validator_revert_t_bool(value) {
        if iszero(eq(value, cleanup_t_bool(value))) { revert(0, 0) }
    }

    function abi_decode_t_bool(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_bool(value)
    }

    function abi_decode_tuple_t_addresst_bool(headStart, dataEnd) -> value0, value1 {
        if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_bool(add(headStart, offset), dataEnd)
        }

    }

    function revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() {
        revert(0, 0)
    }

    function revert_error_987264b3b1d58a9c7f8255e93e81c77d86d6299019c33110a076957a3e06e2ae() {
        revert(0, 0)
    }

    function panic_error_0x41() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x41)
        revert(0, 0x24)
    }

    function finalize_allocation(memPtr, size) {
        let newFreePtr := add(memPtr, round_up_to_mul_of_32(size))
        // protect against overflow
        if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
        mstore(64, newFreePtr)
    }

    function allocate_memory(size) -> memPtr {
        memPtr := allocate_unbounded()
        finalize_allocation(memPtr, size)
    }

    function array_allocation_size_t_bytes_memory_ptr(length) -> size {
        // Make sure we can allocate memory without overflow
        if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

        size := round_up_to_mul_of_32(length)

        // add length slot
        size := add(size, 0x20)

    }

    function copy_calldata_to_memory_with_cleanup(src, dst, length) {

        calldatacopy(dst, src, length)
        mstore(add(dst, length), 0)

    }

    function abi_decode_available_length_t_bytes_memory_ptr(src, length, end) -> array {
        array := allocate_memory(array_allocation_size_t_bytes_memory_ptr(length))
        mstore(array, length)
        let dst := add(array, 0x20)
        if gt(add(src, length), end) { revert_error_987264b3b1d58a9c7f8255e93e81c77d86d6299019c33110a076957a3e06e2ae() }
        copy_calldata_to_memory_with_cleanup(src, dst, length)
    }

    // bytes
    function abi_decode_t_bytes_memory_ptr(offset, end) -> array {
        if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
        let length := calldataload(offset)
        array := abi_decode_available_length_t_bytes_memory_ptr(add(offset, 0x20), length, end)
    }

    function abi_decode_tuple_t_addresst_addresst_uint256t_bytes_memory_ptr(headStart, dataEnd) -> value0, value1, value2, value3 {
        if slt(sub(dataEnd, headStart), 128) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 64

            value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

        {

            let offset := calldataload(add(headStart, 96))
            if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

            value3 := abi_decode_t_bytes_memory_ptr(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_addresst_address(headStart, dataEnd) -> value0, value1 {
        if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

    }

    function panic_error_0x22() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x22)
        revert(0, 0x24)
    }

    function extract_byte_array_length(data) -> length {
        length := div(data, 2)
        let outOfPlaceEncoding := and(data, 1)
        if iszero(outOfPlaceEncoding) {
            length := and(length, 0x7f)
        }

        if eq(outOfPlaceEncoding, lt(length, 32)) {
            panic_error_0x22()
        }
    }

    function abi_encode_tuple_t_address_t_uint256_t_address__to_t_address_t_uint256_t_address__fromStack_reversed(headStart , value2, value1, value0) -> tail {
        tail := add(headStart, 96)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

        abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

        abi_encode_t_address_to_t_address_fromStack(value2,  add(headStart, 64))

    }

    function store_literal_in_memory_99342bc2d068d80ff0602d026937bd5543bf9f2c59c7331dbbe984c8ace8df14(memPtr) {

        mstore(add(memPtr, 0), "The auction is still ongoing")

    }

    function abi_encode_t_stringliteral_99342bc2d068d80ff0602d026937bd5543bf9f2c59c7331dbbe984c8ace8df14_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 28)
        store_literal_in_memory_99342bc2d068d80ff0602d026937bd5543bf9f2c59c7331dbbe984c8ace8df14(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_99342bc2d068d80ff0602d026937bd5543bf9f2c59c7331dbbe984c8ace8df14__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_99342bc2d068d80ff0602d026937bd5543bf9f2c59c7331dbbe984c8ace8df14_to_t_string_memory_ptr_fromStack( tail)

    }

    function panic_error_0x11() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x11)
        revert(0, 0x24)
    }

    function increment_t_uint256(value) -> ret {
        value := cleanup_t_uint256(value)
        if eq(value, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) { panic_error_0x11() }
        ret := add(value, 1)
    }

    function abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack_reversed(headStart , value2, value1, value0) -> tail {
        tail := add(headStart, 96)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

        abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

        abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

    }

    function abi_decode_t_bool_fromMemory(offset, end) -> value {
        value := mload(offset)
        validator_revert_t_bool(value)
    }

    function abi_decode_tuple_t_bool_fromMemory(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_bool_fromMemory(add(headStart, offset), dataEnd)
        }

    }

    function abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack_reversed(headStart , value1, value0) -> tail {
        tail := add(headStart, 64)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

        abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

    }

    function abi_decode_t_uint256_fromMemory(offset, end) -> value {
        value := mload(offset)
        validator_revert_t_uint256(value)
    }

    function abi_decode_tuple_t_uint256_fromMemory(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
        }

    }

    function panic_error_0x32() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x32)
        revert(0, 0x24)
    }

    function checked_mul_t_uint256(x, y) -> product {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        let product_raw := mul(x, y)
        product := cleanup_t_uint256(product_raw)

        // overflow, if x != 0 and y != product/x
        if iszero(
            or(
                iszero(x),
                eq(y, div(product, x))
            )
        ) { panic_error_0x11() }

    }

    function checked_add_t_uint256(x, y) -> sum {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        sum := add(x, y)

        if gt(x, sum) { panic_error_0x11() }

    }

    function store_literal_in_memory_d1cd4f0724dd07ec722cfaec75f5cc41259569e373844a92a470c25b5e518487(memPtr) {

        mstore(add(memPtr, 0), "The auction has ended")

    }

    function abi_encode_t_stringliteral_d1cd4f0724dd07ec722cfaec75f5cc41259569e373844a92a470c25b5e518487_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 21)
        store_literal_in_memory_d1cd4f0724dd07ec722cfaec75f5cc41259569e373844a92a470c25b5e518487(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_d1cd4f0724dd07ec722cfaec75f5cc41259569e373844a92a470c25b5e518487__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_d1cd4f0724dd07ec722cfaec75f5cc41259569e373844a92a470c25b5e518487_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_66598afad5c3ad45986ba444cc454fcc71e2cf4526e48991b00722494f815785(memPtr) {

        mstore(add(memPtr, 0), "You cannot bid 0 token")

    }

    function abi_encode_t_stringliteral_66598afad5c3ad45986ba444cc454fcc71e2cf4526e48991b00722494f815785_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 22)
        store_literal_in_memory_66598afad5c3ad45986ba444cc454fcc71e2cf4526e48991b00722494f815785(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_66598afad5c3ad45986ba444cc454fcc71e2cf4526e48991b00722494f815785__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_66598afad5c3ad45986ba444cc454fcc71e2cf4526e48991b00722494f815785_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_f56bb0b89c7c0ebb440eaa7aef928f797de613d79d834ef0e691c8ef1917626d(memPtr) {

        mstore(add(memPtr, 0), "You do not hold enough tokens fo")

        mstore(add(memPtr, 32), "r this transaction")

    }

    function abi_encode_t_stringliteral_f56bb0b89c7c0ebb440eaa7aef928f797de613d79d834ef0e691c8ef1917626d_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 50)
        store_literal_in_memory_f56bb0b89c7c0ebb440eaa7aef928f797de613d79d834ef0e691c8ef1917626d(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_f56bb0b89c7c0ebb440eaa7aef928f797de613d79d834ef0e691c8ef1917626d__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_f56bb0b89c7c0ebb440eaa7aef928f797de613d79d834ef0e691c8ef1917626d_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_fe82f8929971647923ff7d32a42b81504c30ed1ff89d6e52295fe1133c99e917(memPtr) {

        mstore(add(memPtr, 0), "This bid must be higher than you")

        mstore(add(memPtr, 32), " last bid")

    }

    function abi_encode_t_stringliteral_fe82f8929971647923ff7d32a42b81504c30ed1ff89d6e52295fe1133c99e917_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 41)
        store_literal_in_memory_fe82f8929971647923ff7d32a42b81504c30ed1ff89d6e52295fe1133c99e917(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_fe82f8929971647923ff7d32a42b81504c30ed1ff89d6e52295fe1133c99e917__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_fe82f8929971647923ff7d32a42b81504c30ed1ff89d6e52295fe1133c99e917_to_t_string_memory_ptr_fromStack( tail)

    }

    function checked_sub_t_uint256(x, y) -> diff {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        diff := sub(x, y)

        if gt(diff, x) { panic_error_0x11() }

    }

    function array_dataslot_t_string_storage(ptr) -> data {
        data := ptr

        mstore(0, ptr)
        data := keccak256(0, 0x20)

    }

    function divide_by_32_ceil(value) -> result {
        result := div(add(value, 31), 32)
    }

    function shift_left_dynamic(bits, value) -> newValue {
        newValue :=

        shl(bits, value)

    }

    function update_byte_slice_dynamic32(value, shiftBytes, toInsert) -> result {
        let shiftBits := mul(shiftBytes, 8)
        let mask := shift_left_dynamic(shiftBits, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)
        toInsert := shift_left_dynamic(shiftBits, toInsert)
        value := and(value, not(mask))
        result := or(value, and(toInsert, mask))
    }

    function convert_t_uint256_to_t_uint256(value) -> converted {
        converted := cleanup_t_uint256(identity(cleanup_t_uint256(value)))
    }

    function prepare_store_t_uint256(value) -> ret {
        ret := value
    }

    function update_storage_value_t_uint256_to_t_uint256(slot, offset, value_0) {
        let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
        sstore(slot, update_byte_slice_dynamic32(sload(slot), offset, prepare_store_t_uint256(convertedValue_0)))
    }

    function zero_value_for_split_t_uint256() -> ret {
        ret := 0
    }

    function storage_set_to_zero_t_uint256(slot, offset) {
        let zero_0 := zero_value_for_split_t_uint256()
        update_storage_value_t_uint256_to_t_uint256(slot, offset, zero_0)
    }

    function clear_storage_range_t_bytes1(start, end) {
        for {} lt(start, end) { start := add(start, 1) }
        {
            storage_set_to_zero_t_uint256(start, 0)
        }
    }

    function clean_up_bytearray_end_slots_t_string_storage(array, len, startIndex) {

        if gt(len, 31) {
            let dataArea := array_dataslot_t_string_storage(array)
            let deleteStart := add(dataArea, divide_by_32_ceil(startIndex))
            // If we are clearing array to be short byte array, we want to clear only data starting from array data area.
            if lt(startIndex, 32) { deleteStart := dataArea }
            clear_storage_range_t_bytes1(deleteStart, add(dataArea, divide_by_32_ceil(len)))
        }

    }

    function shift_right_unsigned_dynamic(bits, value) -> newValue {
        newValue :=

        shr(bits, value)

    }

    function mask_bytes_dynamic(data, bytes) -> result {
        let mask := not(shift_right_unsigned_dynamic(mul(8, bytes), not(0)))
        result := and(data, mask)
    }
    function extract_used_part_and_set_length_of_short_byte_array(data, len) -> used {
        // we want to save only elements that are part of the array after resizing
        // others should be set to zero
        data := mask_bytes_dynamic(data, len)
        used := or(data, mul(2, len))
    }
    function copy_byte_array_to_storage_from_t_string_memory_ptr_to_t_string_storage(slot, src) {

        let newLen := array_length_t_string_memory_ptr(src)
        // Make sure array length is sane
        if gt(newLen, 0xffffffffffffffff) { panic_error_0x41() }

        let oldLen := extract_byte_array_length(sload(slot))

        // potentially truncate data
        clean_up_bytearray_end_slots_t_string_storage(slot, oldLen, newLen)

        let srcOffset := 0

        srcOffset := 0x20

        switch gt(newLen, 31)
        case 1 {
            let loopEnd := and(newLen, not(0x1f))

            let dstPtr := array_dataslot_t_string_storage(slot)
            let i := 0
            for { } lt(i, loopEnd) { i := add(i, 0x20) } {
                sstore(dstPtr, mload(add(src, srcOffset)))
                dstPtr := add(dstPtr, 1)
                srcOffset := add(srcOffset, 32)
            }
            if lt(loopEnd, newLen) {
                let lastValue := mload(add(src, srcOffset))
                sstore(dstPtr, mask_bytes_dynamic(lastValue, and(newLen, 0x1f)))
            }
            sstore(slot, add(mul(newLen, 2), 1))
        }
        default {
            let value := 0
            if newLen {
                value := mload(add(src, srcOffset))
            }
            sstore(slot, extract_used_part_and_set_length_of_short_byte_array(value, newLen))
        }
    }

    function array_storeLengthForEncoding_t_string_memory_ptr_nonPadded_inplace_fromStack(pos, length) -> updated_pos {
        updated_pos := pos
    }

    function abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_nonPadded_inplace_fromStack(value, pos) -> end {
        let length := array_length_t_string_memory_ptr(value)
        pos := array_storeLengthForEncoding_t_string_memory_ptr_nonPadded_inplace_fromStack(pos, length)
        copy_memory_to_memory_with_cleanup(add(value, 0x20), pos, length)
        end := add(pos, length)
    }

    // string -> string
    function abi_encode_t_string_storage_to_t_string_memory_ptr_nonPadded_inplace_fromStack(value, pos) -> ret {
        let slotValue := sload(value)
        let length := extract_byte_array_length(slotValue)
        pos := array_storeLengthForEncoding_t_string_memory_ptr_nonPadded_inplace_fromStack(pos, length)
        switch and(slotValue, 1)
        case 0 {
            // short byte array
            mstore(pos, and(slotValue, not(0xff)))
            ret := add(pos, mul(length, iszero(iszero(length))))
        }
        case 1 {
            // long byte array
            let dataPos := array_dataslot_t_string_storage(value)
            let i := 0
            for { } lt(i, length) { i := add(i, 0x20) } {
                mstore(add(pos, i), sload(dataPos))
                dataPos := add(dataPos, 1)
            }
            ret := add(pos, length)
        }
    }

    function abi_encode_tuple_packed_t_string_memory_ptr_t_string_memory_ptr_t_string_storage__to_t_string_memory_ptr_t_string_memory_ptr_t_string_memory_ptr__nonPadded_inplace_fromStack_reversed(pos , value2, value1, value0) -> end {

        pos := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_nonPadded_inplace_fromStack(value0,  pos)

        pos := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_nonPadded_inplace_fromStack(value1,  pos)

        pos := abi_encode_t_string_storage_to_t_string_memory_ptr_nonPadded_inplace_fromStack(value2,  pos)

        end := pos
    }

    function array_length_t_bytes_memory_ptr(value) -> length {

        length := mload(value)

    }

    function array_storeLengthForEncoding_t_bytes_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr_fromStack(value, pos) -> end {
        let length := array_length_t_bytes_memory_ptr(value)
        pos := array_storeLengthForEncoding_t_bytes_memory_ptr_fromStack(pos, length)
        copy_memory_to_memory_with_cleanup(add(value, 0x20), pos, length)
        end := add(pos, round_up_to_mul_of_32(length))
    }

    function abi_encode_tuple_t_address_t_address_t_uint256_t_bytes_memory_ptr__to_t_address_t_address_t_uint256_t_bytes_memory_ptr__fromStack_reversed(headStart , value3, value2, value1, value0) -> tail {
        tail := add(headStart, 128)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

        abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

        abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

        mstore(add(headStart, 96), sub(tail, headStart))
        tail := abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr_fromStack(value3,  tail)

    }

    function abi_decode_t_bytes4_fromMemory(offset, end) -> value {
        value := mload(offset)
        validator_revert_t_bytes4(value)
    }

    function abi_decode_tuple_t_bytes4_fromMemory(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_bytes4_fromMemory(add(headStart, offset), dataEnd)
        }

    }

    function panic_error_0x12() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x12)
        revert(0, 0x24)
    }

    function panic_error_0x31() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x31)
        revert(0, 0x24)
    }

}
