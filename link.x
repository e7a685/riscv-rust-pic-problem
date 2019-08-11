ENTRY(_start)

SECTIONS {
  . = 0x80000000;
  _s_all = .;

  .text :
  {
    *(.text.init);
    *(.text .text.*);
  } 

  .rodata :
  {
    *(.rodata)
    *(.rodata.*)
  } 


  .data :
  {
    . = ALIGN(4);
    *(.sdata .sdata.* .sdata2 .sdata2.*);
    *(.data .data.*);
  }

  .bss (NOLOAD) :
  {
    . = ALIGN(4);
    _sbss = .;
    *(.bss .bss.*)
    _ebss = .;
  }

  . = ALIGN(4);
  _e_all = .;
}
