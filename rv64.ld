OUTPUT_ARCH("riscv")
OUTPUT_FORMAT("elf64-littleriscv")
ENTRY(_start)

PHDRS
{
    text 	PT_LOAD FLAGS(5);      /* Read (1) + Execute (4) */
    rodata 	PT_LOAD FLAGS(4);    /* Read (4) */
    data 	PT_LOAD FLAGS(6);      /* Read (2) + Write (4) */
}

SECTIONS
{
    /* Read + Execute segment */
    . = 0x80000000;
    .text : {
        *(.text.init)
        *(.text*)
    } : text

    /* Read-only segment */
    . = ALIGN(0x1000);
    .rodata : {
        *(.rodata*)
        *(.srodata*)
    } : rodata
    
    /* Read + Write segment */
    . = ALIGN(0x1000);
    .sdata : {
        _gp = . + 0x800;
        *(.sdata*)
    } : data

    .data : {
        . = ALIGN(16);
        *(.data*)
    } : data

    .sbss : {
        . = ALIGN(16);
        __sbss_start = .;
        *(.sbss*)
        __sbss_end = .;
    } : data

    .bss : {
        . = ALIGN(16);
        __bss_start = .;
        *(.bss*)
        *(COMMON)
        __bss_end = .;
    } : data

    /* Discard unnecessary sections */
    /DISCARD/ : {
        *(.eh_frame)
        *(.comment)
        *(.note*)
        *(.gnu*)
    }
}
