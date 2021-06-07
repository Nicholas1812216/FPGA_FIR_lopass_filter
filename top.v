`timescale 1ns / 1ps


module top(

   input reset,
   input clk_100MHz,
   input valid,
   input [16:0] x,
   output [16:0] y

    );
    wire [34:0] y_temp,
         z_40,z_39,z_38,z_37,z_36,z_35,z_34,z_33,z_32,z_31,z_30,
         z_29,z_28,z_27,z_26,z_25,z_24,z_23,z_22,z_21,z_20,
         z_19,z_18,z_17,z_16,z_15,z_14,z_13,z_12,z_11,z_10,
         z_09,z_08,z_07,z_06,z_05,z_04,z_03,z_02,z_01,z_00;
         
    assign y = y_temp[30:14];
    //41 DSP slices implementing the fixed point lo pass filter difference equation
    //P = A * B + C
    //A and B are 17 bits
    //C is 34 bits
    //P is 35 bits (A * B produces a 34 bit result, summing with a 34 bit number produces a 35 bit result)
    //A is the input x, B holds the 17 bit coefficient value, taken from hdl_ref_coefficients.txt
    dsp_mac_block z_00_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h00005),
      .C(z_01[33:0]),
      .P(y_temp)
                      );     

    dsp_mac_block z_01_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h00008),
      .C(z_02[33:0]),
      .P(z_01)
                      ); 
 
    dsp_mac_block z_02_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h00008),
      .C(z_03[33:0]),
      .P(z_02)
                      );                       
                      
    dsp_mac_block z_03_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h00002),
      .C(z_04[33:0]),
      .P(z_03)
                      );   
 
    dsp_mac_block z_04_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h1fff3),
      .C(z_05[33:0]),
      .P(z_04)
                      );                       
                      
    dsp_mac_block z_05_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h1ffd8),
      .C(z_06[33:0]),
      .P(z_05)
                      );  
 
 
    dsp_mac_block z_06_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h1ffb3),
      .C(z_07[33:0]),
      .P(z_06)
                      );                       
                      
    dsp_mac_block z_07_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h1ff8a),
      .C(z_08[33:0]),
      .P(z_07)
                      );   
 
    dsp_mac_block z_08_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h1ff66),
      .C(z_09[33:0]),
      .P(z_08)
                      );                       
                      
    dsp_mac_block z_09_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h1ff56),
      .C(z_10[33:0]),
      .P(z_09)
                      );                      
    
    
    dsp_mac_block z_10_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h1ff6b),
      .C(z_11[33:0]),
      .P(z_10)
                      );     

    dsp_mac_block z_11_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h1ffb4),
      .C(z_12[33:0]),
      .P(z_11)
                      ); 
 
    dsp_mac_block z_12_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h0003e),
      .C(z_13[33:0]),
      .P(z_12)
                      );                       
                      
    dsp_mac_block z_13_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h0010d),
      .C(z_14[33:0]),
      .P(z_13)
                      );   
 
    dsp_mac_block z_14_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h00218),
      .C(z_15[33:0]),
      .P(z_14)
                      );                       
                      
    dsp_mac_block z_15_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h0034f),
      .C(z_16[33:0]),
      .P(z_15)
                      );  
 
 
    dsp_mac_block z_16_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h00494),
      .C(z_17[33:0]),
      .P(z_16)
                      );                       
                      
    dsp_mac_block z_17_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h005c7),
      .C(z_18[33:0]),
      .P(z_17)
                      );   
 
    dsp_mac_block z_18_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h006c2),
      .C(z_19[33:0]),
      .P(z_18)
                      );                       
                      
    dsp_mac_block z_19_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h00766),
      .C(z_20[33:0]),
      .P(z_19)
                      );                      
    
    
    dsp_mac_block z_20_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h007a0),
      .C(z_21[33:0]),
      .P(z_20)
                      );     

    dsp_mac_block z_21_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h00766),
      .C(z_22[33:0]),
      .P(z_21)
                      ); 
 
    dsp_mac_block z_22_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h006c2),
      .C(z_23[33:0]),
      .P(z_22)
                      );                       
                      
    dsp_mac_block z_23_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h005c7),
      .C(z_24[33:0]),
      .P(z_23)
                      );   
 
    dsp_mac_block z_24_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h00494),
      .C(z_25[33:0]),
      .P(z_24)
                      );                       
                      
    dsp_mac_block z_25_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h0034f),
      .C(z_26[33:0]),
      .P(z_25)
                      );  
 
 
    dsp_mac_block z_26_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h00218),
      .C(z_27[33:0]),
      .P(z_26)
                      );                       
                      
    dsp_mac_block z_27_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h0010d),
      .C(z_28[33:0]),
      .P(z_27)
                      );   
 
    dsp_mac_block z_28_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h0003e),
      .C(z_29[33:0]),
      .P(z_28)
                      );                       
                      
    dsp_mac_block z_29_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h1ffb4),
      .C(z_30[33:0]),
      .P(z_29)
                      );                      
    
    
    dsp_mac_block z_30_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h1ff6b),
      .C(z_31[33:0]),
      .P(z_30)
                      );     

    dsp_mac_block z_31_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h1ff56),
      .C(z_32[33:0]),
      .P(z_31)
                      ); 
 
    dsp_mac_block z_32_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h1ff66),
      .C(z_33[33:0]),
      .P(z_32)
                      );                       
                      
    dsp_mac_block z_33_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h1ff8a),
      .C(z_34[33:0]),
      .P(z_33)
                      );   
 
    dsp_mac_block z_34_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h1ffb3),
      .C(z_35[33:0]),
      .P(z_34)
                      );                       
                      
    dsp_mac_block z_35_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h1ffd8),
      .C(z_36[33:0]),
      .P(z_35)
                      );  
 
 
    dsp_mac_block z_36_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h1fff3),
      .C(z_37[33:0]),
      .P(z_36)
                      );                       
                      
    dsp_mac_block z_37_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h00002),
      .C(z_38[33:0]),
      .P(z_37)
                      );   
 
    dsp_mac_block z_38_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h00008),
      .C(z_39[33:0]),
      .P(z_38)
                      );                       
                      
    dsp_mac_block z_39_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h00008),
      .C(z_40[33:0]),
      .P(z_39)
                      );                      
                      

    dsp_mac_block z_40_inst(
      .CLK(clk_100MHz),
      .A(x),
      .B(17'h00005),
      .C(34'h0),
      .P(z_40)
                      );
     
    
    
endmodule
