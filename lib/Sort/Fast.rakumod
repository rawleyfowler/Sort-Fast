use v6.d;

use NativeCall;
use MONKEY-TYPING;

constant $lib = %?RESOURCES<libraries/dpqs> // 'resources/libraries/libdpqs.so';

sub dpqs_sort(CArray[num64] $array, uint64 $lo, uint64 $hi) is native($lib) { * }

sub sort-fast(@array) is export {
    my @c := CArray[num64].new;

    given @array {
        when Array[Num] {
            @c[$_] = @array[$_] for ^@array.elems;
        }

        default {
            @c[$_] = @array[$_].Num for ^@array.elems;
        }
    }

    dpqs_sort(@c, 0, @array.elems - 1);
    @c.Array;
}

augment class Array {
    method sort-fast {
        sort-fast(self);
    }
}

augment class List {
    method sort-fast {
        sort-fast(self.Array).List;
    }
}
