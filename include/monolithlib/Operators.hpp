#ifndef _MLIB_OPERATORS_HPP
#define _MLIB_OPERATORS_HPP

#include "types.h"

typedef struct HeapListEntry {
    HeapListEntry* prev;
    HeapListEntry* next;
    u32 unk8;
    u32 unkC;
    u16 unk10;
} HeapListEntry;

extern HeapListEntry* func_804339B8(void*, HeapListEntry*);
extern void func_80433AA8(void*, HeapListEntry*);

void operator delete(void*);
void operator delete[](void*);

extern u32 memoryAllocHeapArray[80][28];
extern f64 lbl_8066C9B8;

#endif