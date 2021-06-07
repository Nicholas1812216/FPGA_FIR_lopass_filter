`timescale 1ns / 1ps

module sim();

//loading and storing the matlab reference input and output
reg [16:0] x_ref [1000:0];
reg [16:0] y_ref [1000:0];
initial 
  begin
    $readmemh("C:/Users/19259/Documents/matlab_Hdl/low_pass_autogenfilter/hdl_ref_x.txt",x_ref);
    $readmemh("C:/Users/19259/Documents/matlab_Hdl/low_pass_autogenfilter/hdl_ref_y.txt",y_ref);
  end

reg reset = 0, clk_100MHz,valid = 1;
reg [16:0] x, y_ref_val;
reg [16:0] y_error_test;

//finding the difference between the HDL filter implementation and the matlab implementation
wire [17:0] abserror = (y_error_test > y_ref_val) ? (y_error_test - y_ref_val) : (y_ref_val - y_error_test);

//calculating the percent error
wire [33:0] percent_error_temp = abserror[16:0] / y_ref_val;
wire [16:0] percent_error = percent_error_temp[30:14];
wire [16:0] y;

//100MHz clock generation
always begin
  #5 clk_100MHz = 0;
  #5 clk_100MHz = 1;
end

//filter instantiation
top DUT(

   .reset,
   .clk_100MHz(clk_100MHz),
   .valid(valid),
   .x(x),
   .y(y)

    );
    
    //for loop to cycle through all x values, one every clock period
initial begin
  for(int i = 0; i < 1001; i++) begin
    x = x_ref[i];
    #10;
    
    //finding absolute value of matlab generated y value
    y_ref_val = y_ref[i];
      if(y_ref_val[16]) begin
      y_ref_val = -1 * y_ref_val;
    end      
    

    
    
  end
end

//finding absolute value of HDL filter y value
always@(*) begin
    if(y[16]) begin
      y_error_test = y * -1;
    end
    else begin
      y_error_test = y;
    end
    

    
end

endmodule
