#include "monolithlib/Operators.hpp"
#include "fdlibm.h"


u32 memoryAllocHeapArray[80][28]; //bss
u32 lbl_80665E30 = -1;
f64 lbl_8066C9B8 = 1.0;


//doesn't seem like operator new
void* operator new(u32 arg0) {
    return 0;
}


void operator delete(void* p) {
    if(p != NULL){
        if(lbl_80665E30 != -1){
            HeapListEntry* temp_r4 = (HeapListEntry*)((u32)p - 0x20);
            u32* memoryAllocHeapArray_ptr = memoryAllocHeapArray[(u8)temp_r4->unk10];
            
            if((temp_r4->unkC - 0x21) > 0x07FFFFDE){
                //calculates ln(1), which is 0 (also 0 in hex). it gets put into f1, so it should be returned?
                //this might be part of debug code and this line wasn't commented out
                float f0 = log(lbl_8066C9B8);
                return;
            }
        
            memoryAllocHeapArray_ptr[8] += temp_r4->unkC;
        
            if(temp_r4->prev != NULL){
                temp_r4->prev->next = temp_r4->next;
            }
        
            if(temp_r4->next != NULL) {
                temp_r4->next->prev = temp_r4->prev;
            }
        
            if (memoryAllocHeapArray_ptr[2] == (u32)temp_r4) {
                memoryAllocHeapArray_ptr[2] = (u32)temp_r4->next;
            }
        
            if (memoryAllocHeapArray_ptr[3] == (u32)temp_r4) {
                memoryAllocHeapArray_ptr[3] = (u32)temp_r4->prev;
            }
        
            HeapListEntry* var_r3 = func_804339B8(memoryAllocHeapArray_ptr, temp_r4);
            HeapListEntry* temp_r5 = var_r3->prev;
        
            if (temp_r5 != NULL) {   
                if ((u32)var_r3 == ((u32)temp_r5 + temp_r5->unkC)) {
                    temp_r5->unkC += var_r3->unkC;
                
                    if ((u32)var_r3 == memoryAllocHeapArray_ptr[1]) {
                        memoryAllocHeapArray_ptr[1] = (u32)temp_r5;
                    }
                
                    temp_r5->next = var_r3->next;
                
                    if (var_r3->next != NULL) {
                        var_r3->next->prev = temp_r5;
                        var_r3 = temp_r5;
                    }
                }
            }
        
            HeapListEntry* var_r4 = var_r3->next;
        
            if (var_r4 != NULL) {
                HeapListEntry* temp_r5_2 = var_r4->prev;
            
                if (temp_r5_2 != NULL) {
                    if((u32)var_r4 == ((u32)temp_r5_2 + temp_r5_2->unkC)) {
                        temp_r5_2->unkC += var_r4->unkC;
                    
                        if ((u32)var_r4 == memoryAllocHeapArray_ptr[1]) {
                            memoryAllocHeapArray_ptr[1] = (u32)temp_r5_2;
                        }
                    
                        temp_r5_2->next = var_r4->next;
                    
                        if (var_r4->next != NULL) {
                            var_r4->next->prev = temp_r5_2;
                            var_r4 = temp_r5_2;
                        }
                    }
                }

                var_r4 = var_r4->next;
            
                if (var_r4 != NULL) {
                    func_80433AA8(memoryAllocHeapArray_ptr, var_r4);
                }
            }
            
            memoryAllocHeapArray_ptr[6]--;
        }
    }
}

void operator delete[](void* p) {
    if(p != NULL){
        if(lbl_80665E30 != -1){
            HeapListEntry* temp_r4 = (HeapListEntry*)((u32)p - 0x20);
            u32* memoryAllocHeapArray_ptr = memoryAllocHeapArray[(u8)temp_r4->unk10];
            
            if((temp_r4->unkC - 0x21) > 0x07FFFFDE){
                //calculates ln(1), which is 0 (also 0 in hex). it gets put into f1, so it should be returned?
                //this might be part of debug code and this line wasn't commented out
                float f0 = log(1.0);
                return;
            }
        
            memoryAllocHeapArray_ptr[8] += temp_r4->unkC;
        
            if(temp_r4->prev != NULL){
                temp_r4->prev->next = temp_r4->next;
            }
        
            if(temp_r4->next != NULL) {
                temp_r4->next->prev = temp_r4->prev;
            }
        
            if (memoryAllocHeapArray_ptr[2] == (u32)temp_r4) {
                memoryAllocHeapArray_ptr[2] = (u32)temp_r4->next;
            }
        
            if (memoryAllocHeapArray_ptr[3] == (u32)temp_r4) {
                memoryAllocHeapArray_ptr[3] = (u32)temp_r4->prev;
            }
        
            HeapListEntry* var_r3 = func_804339B8(memoryAllocHeapArray_ptr, temp_r4);
            HeapListEntry* temp_r5 = var_r3->prev;
        
            if (temp_r5 != NULL) {   
                if ((u32)var_r3 == ((u32)temp_r5 + temp_r5->unkC)) {
                    temp_r5->unkC += var_r3->unkC;
                
                    if ((u32)var_r3 == memoryAllocHeapArray_ptr[1]) {
                        memoryAllocHeapArray_ptr[1] = (u32)temp_r5;
                    }
                
                    temp_r5->next = var_r3->next;
                
                    if (var_r3->next != NULL) {
                        var_r3->next->prev = temp_r5;
                        var_r3 = temp_r5;
                    }
                }
            }
        
            HeapListEntry* var_r4 = var_r3->next;
        
            if (var_r4 != NULL) {
                HeapListEntry* temp_r5_2 = var_r4->prev;
            
                if (temp_r5_2 != NULL) {
                    if((u32)var_r4 == ((u32)temp_r5_2 + temp_r5_2->unkC)) {
                        temp_r5_2->unkC += var_r4->unkC;
                    
                        if ((u32)var_r4 == memoryAllocHeapArray_ptr[1]) {
                            memoryAllocHeapArray_ptr[1] = (u32)temp_r5_2;
                        }
                    
                        temp_r5_2->next = var_r4->next;
                    
                        if (var_r4->next != NULL) {
                            var_r4->next->prev = temp_r5_2;
                            var_r4 = temp_r5_2;
                        }
                    }
                }

                var_r4 = var_r4->next;
            
                if (var_r4 != NULL) {
                    func_80433AA8(memoryAllocHeapArray_ptr, var_r4);
                }
            }
            
            memoryAllocHeapArray_ptr[6]--;
        }
    }
}