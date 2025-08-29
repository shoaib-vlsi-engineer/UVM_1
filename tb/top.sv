module top;
  	import uvm_pkg::*;
	
  
	//import ram_pkg
    import ram_pkg::*;
   	 

	// Declare two handles of write_xtn class wr_copy_xtnh and wr_clone_xtnh 
    write_xtn wr_copy_xtnh;
    write_xtn wr_clone_xtnh;

       
   

 	// Declare dynamic array of handles for write_xtn as wr_xtnh
   // A dynamic array of handles means: instead of storing plain data (like int, bit, etc.), the array stores object handles (pointers) to class objects.
    write_xtn wr_xtnh[];



	// Declare a variable no_trans as int data type and initialize it with value 10.
 	int no_trans = 10;

        
	// Within initial block
 	initial
	  begin
		

		// Allocate the size of above declared array equal to 10
        wr_xtnh = new[no_trans];

		 
		// Within for loop, Generate ten random transactions	
		// Create 10 tr class objects with different strings using $sformatf 
		// randomize & print the 10 transaction class objects
		for (int i = 0; i < no_trans; i++) begin
          wr_xtnh[i] = write_xtn::type_id::create($sformatf("wr_xtn_%0d", i));
          void'(wr_xtnh[i].randomize());
           wr_xtnh[i].print();
        end

			
	  
	  
		// Copy the 5th transaction item into the 3rd transaction item using copy method 
	    wr_xtnh[2].copy(wr_xtnh[4]);


		// Copy the 3rd transaction item into another item(wr_copy_xtnh) using copy method
		// Note : Do create an instance for wr_copy_xtnh
         wr_copy_xtnh = write_xtn::type_id::create("wr_copy_xtnh");
         wr_copy_xtnh.copy(wr_xtnh[2]);


		
		//Print the object wr_copy_xtnh in a tree format
		wr_copy_xtnh.print(uvm_default_tree_printer);


		// Call Compare method on the 5th and 3rd transaction items
		if (wr_xtnh[4].compare(wr_xtnh[2]))
          `uvm_info("TOP", "5th and 3rd transactions are SAME", UVM_MEDIUM)
        else
          `uvm_info("TOP", "5th and 3rd transactions are DIFFERENT", UVM_MEDIUM)


		// Using clone() method copy the 8th item to another item(wr_clone_xtnh)
		// Note : Do not create an instance for wr_clone_xtnh
		$cast(wr_clone_xtnh, wr_xtnh[7].clone());

		
		//Print the object wr_clone_xtnh in a line format
	     wr_clone_xtnh.print(uvm_default_line_printer);


	  end		


endmodule : top
