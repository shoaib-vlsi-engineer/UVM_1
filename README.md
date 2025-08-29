UVM_1 (Stimulus Modeling)
│
├── wr_agt_top/
│   ├── write_xtn.sv
│   ├── write_xtn_macros.sv
│
├── packages/
│   └── ram_pkg.sv
│
├── tb/
│   └── top.sv
│
└── sim/
    └── Makefile


This work focuses on creating a UVM sequence item and exploring built-in UVM methods such as copy, compare, print, and clone. The write_xtn.sv file extends uvm_sequence_item and includes randomized fields (data, address, write) along with control knobs (xtn_type, xtn_delay) and appropriate constraints. Standard UVM methods including new, do_copy, do_compare, do_print, and post_randomize were implemented. An alternative version using UVM field macros is provided in write_xtn_macros.sv.

The package ram_pkg.sv imports uvm_pkg and includes necessary files and definitions, while top.sv demonstrates the creation of 10 randomized transactions, performing copy, compare, and clone operations, and printing the objects in tree and line formats.

Key Learnings -

Modeling transactions in UVM using uvm_sequence_item.

Utilizing built-in methods: copy, compare, print, and clone.

Understanding manual methods versus UVM field macros for transaction management.
