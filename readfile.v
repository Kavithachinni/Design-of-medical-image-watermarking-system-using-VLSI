
module testbench;

  // Define parameters
  parameter INPUT_FILENAME1 = "E:\\watermarking code\\matlab code\\LL1.txt"; // Name of input file
  parameter INPUT_FILENAME2 = "E:\\watermarking code\\matlab code\\LL2.txt"; // Name of input file
  parameter OUTPUT_FILENAME = "E:\\watermarking code\\matlab code\\LLNEW.txt"; // Name of output file

  // Define inputs and outputs
  reg [31:0] LL1;
  reg [31:0] LL2, alpha;
  wire [31:0] LLNEW;

  // Instantiate the module to be tested
embeddening UUT (LL1,LL2,alpha,LLNEW);
  // Open input file
  integer input_file1,input_file2;
  initial 
  begin
    input_file1 = $fopen(INPUT_FILENAME1, "r");
	 input_file2 = $fopen(INPUT_FILENAME2, "r");
    if ((input_file1&&input_file2) == 0) 
	 begin
      $display("Error: could not open input file '%s'", INPUT_FILENAME1);
		$display("Error: could not open input file '%s'", INPUT_FILENAME2);
      $finish;
    end
  end

  // Open output file
  integer output_file;
  initial begin
    output_file = $fopen(OUTPUT_FILENAME, "w");
    if (output_file == 0) begin
      $display("Error: could not open output file '%s'", OUTPUT_FILENAME);
      $finish;
    end
  end

  // Reset generation
  initial 
  begin
    alpha = 1;
  end

  // Test sequence
  integer num_values = 0;
  integer delay_count = 0;
  initial 
  begin
    // Read input values from file and apply to DUT
    while (!$feof(input_file1)&&!$feof(input_file2)) 
	 begin
      $fscanf(input_file1, "%d", LL1);
		$fscanf(input_file2, "%d", LL2);
      delay_count = 0;
      while (delay_count < 1) begin // Delay for 10 simulation time units
        #1;
        delay_count = delay_count + 1;
      end
      num_values = num_values + 1;

      // Write output data to file
      $fdisplay(output_file, "%d", LLNEW);
    end

    // Close files
    $fclose(input_file1);
	 $fclose(input_file2);
    $fclose(output_file);
	 end
endmodule
	 