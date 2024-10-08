//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux_4_1_width_2
(
  input  [1:0] d0, d1, d2, d3,
  input  [1:0] sel,
  output [1:0] y
);

  assign y = sel [1] ? (sel [0] ? d3 : d2)
                     : (sel [0] ? d1 : d0);

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module mux_4_1
(
  input  [3:0] d0, d1, d2, d3,
  input  [1:0] sel,
  output [3:0] y
);

  // Task:
  // Implement mux_4_1 with 4-bit data
  // using two instances of mux_4_1_width_2 with 2-bit data

  // SOLUTION

  wire [1:0] out_high, out_low;

  mux_4_1_width_2 mux_low (.d0(d0[1:0]), .d1(d1[1:0]), .d2(d2[1:0]), .d3(d3[1:0]), .sel(sel), .y(out_low));
  mux_4_1_width_2 mux_high (.d0(d0[3:2]), .d1(d1[3:2]), .d2(d2[3:2]), .d3(d3[3:2]), .sel(sel), .y(out_high));

  assign y = {{out_high},{out_low}};

endmodule