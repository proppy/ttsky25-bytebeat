module bytebeat(
  input wire clk,
  input wire reset,
  input wire [3:0] bytebeat__a_r,
  input wire bytebeat__a_r_vld,
  input wire [3:0] bytebeat__b_r,
  input wire bytebeat__b_r_vld,
  input wire [3:0] bytebeat__c_r,
  input wire bytebeat__c_r_vld,
  input wire [3:0] bytebeat__d_r,
  input wire bytebeat__d_r_vld,
  input wire bytebeat__output_s_rdy,
  output wire bytebeat__a_r_rdy,
  output wire bytebeat__b_r_rdy,
  output wire bytebeat__c_r_rdy,
  output wire bytebeat__d_r_rdy,
  output wire [7:0] bytebeat__output_s,
  output wire bytebeat__output_s_vld
);
  // lint_off MULTIPLY
  function automatic [7:0] umul8b_8b_x_4b (input reg [7:0] lhs, input reg [3:0] rhs);
    begin
      umul8b_8b_x_4b = lhs * rhs;
    end
  endfunction
  // lint_on MULTIPLY
  reg [3:0] ____state_1;
  reg [3:0] ____state_3;
  reg [31:0] ____state_4;
  reg [3:0] ____state_0;
  reg [3:0] ____state_2;
  reg [3:0] __bytebeat__b_r_reg;
  reg __bytebeat__b_r_valid_reg;
  reg [3:0] __bytebeat__d_r_reg;
  reg __bytebeat__d_r_valid_reg;
  reg [3:0] __bytebeat__a_r_reg;
  reg __bytebeat__a_r_valid_reg;
  reg [3:0] __bytebeat__c_r_reg;
  reg __bytebeat__c_r_valid_reg;
  reg [7:0] __bytebeat__output_s_reg;
  reg __bytebeat__output_s_valid_reg;
  wire [3:0] bytebeat__b_r_select;
  wire [3:0] bytebeat__d_r_select;
  wire [3:0] bytebeat__a_r_select;
  wire [3:0] b;
  wire [3:0] bytebeat__c_r_select;
  wire [3:0] d;
  wire bytebeat__output_s_valid_inv;
  wire [3:0] a;
  wire [31:0] shrl_261;
  wire [3:0] c;
  wire [31:0] shrl_263;
  wire bytebeat__output_s_valid_load_en;
  wire bytebeat__a_r_valid_inv;
  wire bytebeat__b_r_valid_inv;
  wire bytebeat__c_r_valid_inv;
  wire bytebeat__d_r_valid_inv;
  wire [7:0] umul_264;
  wire [7:0] umul_266;
  wire bytebeat__a_r_valid_load_en;
  wire bytebeat__b_r_valid_load_en;
  wire bytebeat__c_r_valid_load_en;
  wire bytebeat__d_r_valid_load_en;
  wire bytebeat__a_r_load_en;
  wire bytebeat__b_r_load_en;
  wire bytebeat__c_r_load_en;
  wire bytebeat__d_r_load_en;
  wire and_307;
  wire and_309;
  wire and_311;
  wire and_313;
  wire [31:0] add_276;
  wire [7:0] s;
  wire __bytebeat__output_s_vld_buf;
  assign bytebeat__b_r_select = __bytebeat__b_r_valid_reg ? __bytebeat__b_r_reg : 4'h0;
  assign bytebeat__d_r_select = __bytebeat__d_r_valid_reg ? __bytebeat__d_r_reg : 4'h0;
  assign bytebeat__a_r_select = __bytebeat__a_r_valid_reg ? __bytebeat__a_r_reg : 4'h0;
  assign b = __bytebeat__b_r_valid_reg ? bytebeat__b_r_select : ____state_1;
  assign bytebeat__c_r_select = __bytebeat__c_r_valid_reg ? __bytebeat__c_r_reg : 4'h0;
  assign d = __bytebeat__d_r_valid_reg ? bytebeat__d_r_select : ____state_3;
  assign bytebeat__output_s_valid_inv = ~__bytebeat__output_s_valid_reg;
  assign a = __bytebeat__a_r_valid_reg ? bytebeat__a_r_select : ____state_0;
  assign shrl_261 = ____state_4 >> b;
  assign c = __bytebeat__c_r_valid_reg ? bytebeat__c_r_select : ____state_2;
  assign shrl_263 = ____state_4 >> d;
  assign bytebeat__output_s_valid_load_en = bytebeat__output_s_rdy | bytebeat__output_s_valid_inv;
  assign bytebeat__a_r_valid_inv = ~__bytebeat__a_r_valid_reg;
  assign bytebeat__b_r_valid_inv = ~__bytebeat__b_r_valid_reg;
  assign bytebeat__c_r_valid_inv = ~__bytebeat__c_r_valid_reg;
  assign bytebeat__d_r_valid_inv = ~__bytebeat__d_r_valid_reg;
  assign umul_264 = umul8b_8b_x_4b(____state_4[7:0], a);
  assign umul_266 = umul8b_8b_x_4b(____state_4[7:0], c);
  assign bytebeat__a_r_valid_load_en = bytebeat__output_s_valid_load_en | bytebeat__a_r_valid_inv;
  assign bytebeat__b_r_valid_load_en = bytebeat__output_s_valid_load_en | bytebeat__b_r_valid_inv;
  assign bytebeat__c_r_valid_load_en = bytebeat__output_s_valid_load_en | bytebeat__c_r_valid_inv;
  assign bytebeat__d_r_valid_load_en = bytebeat__output_s_valid_load_en | bytebeat__d_r_valid_inv;
  assign bytebeat__a_r_load_en = bytebeat__a_r_vld & bytebeat__a_r_valid_load_en;
  assign bytebeat__b_r_load_en = bytebeat__b_r_vld & bytebeat__b_r_valid_load_en;
  assign bytebeat__c_r_load_en = bytebeat__c_r_vld & bytebeat__c_r_valid_load_en;
  assign bytebeat__d_r_load_en = bytebeat__d_r_vld & bytebeat__d_r_valid_load_en;
  assign and_307 = __bytebeat__a_r_valid_reg & bytebeat__output_s_valid_load_en;
  assign and_309 = __bytebeat__b_r_valid_reg & bytebeat__output_s_valid_load_en;
  assign and_311 = __bytebeat__c_r_valid_reg & bytebeat__output_s_valid_load_en;
  assign and_313 = __bytebeat__d_r_valid_reg & bytebeat__output_s_valid_load_en;
  assign add_276 = ____state_4 + 32'h0000_0001;
  assign s = umul_264 & shrl_261[7:0] | umul_266 & shrl_263[7:0];
  assign __bytebeat__output_s_vld_buf = 1'h1;
  always @ (posedge clk) begin
    if (reset) begin
      ____state_1 <= 4'h7;
      ____state_3 <= 4'ha;
      ____state_4 <= 32'h0000_0000;
      ____state_0 <= 4'h5;
      ____state_2 <= 4'h3;
      __bytebeat__b_r_reg <= 4'h0;
      __bytebeat__b_r_valid_reg <= 1'h0;
      __bytebeat__d_r_reg <= 4'h0;
      __bytebeat__d_r_valid_reg <= 1'h0;
      __bytebeat__a_r_reg <= 4'h0;
      __bytebeat__a_r_valid_reg <= 1'h0;
      __bytebeat__c_r_reg <= 4'h0;
      __bytebeat__c_r_valid_reg <= 1'h0;
      __bytebeat__output_s_reg <= 8'h00;
      __bytebeat__output_s_valid_reg <= 1'h0;
    end else begin
      ____state_1 <= and_309 ? bytebeat__b_r_select : ____state_1;
      ____state_3 <= and_313 ? bytebeat__d_r_select : ____state_3;
      ____state_4 <= bytebeat__output_s_valid_load_en ? add_276 : ____state_4;
      ____state_0 <= and_307 ? bytebeat__a_r_select : ____state_0;
      ____state_2 <= and_311 ? bytebeat__c_r_select : ____state_2;
      __bytebeat__b_r_reg <= bytebeat__b_r_load_en ? bytebeat__b_r : __bytebeat__b_r_reg;
      __bytebeat__b_r_valid_reg <= bytebeat__b_r_valid_load_en ? bytebeat__b_r_vld : __bytebeat__b_r_valid_reg;
      __bytebeat__d_r_reg <= bytebeat__d_r_load_en ? bytebeat__d_r : __bytebeat__d_r_reg;
      __bytebeat__d_r_valid_reg <= bytebeat__d_r_valid_load_en ? bytebeat__d_r_vld : __bytebeat__d_r_valid_reg;
      __bytebeat__a_r_reg <= bytebeat__a_r_load_en ? bytebeat__a_r : __bytebeat__a_r_reg;
      __bytebeat__a_r_valid_reg <= bytebeat__a_r_valid_load_en ? bytebeat__a_r_vld : __bytebeat__a_r_valid_reg;
      __bytebeat__c_r_reg <= bytebeat__c_r_load_en ? bytebeat__c_r : __bytebeat__c_r_reg;
      __bytebeat__c_r_valid_reg <= bytebeat__c_r_valid_load_en ? bytebeat__c_r_vld : __bytebeat__c_r_valid_reg;
      __bytebeat__output_s_reg <= bytebeat__output_s_valid_load_en ? s : __bytebeat__output_s_reg;
      __bytebeat__output_s_valid_reg <= bytebeat__output_s_valid_load_en ? __bytebeat__output_s_vld_buf : __bytebeat__output_s_valid_reg;
    end
  end
  assign bytebeat__a_r_rdy = bytebeat__a_r_load_en;
  assign bytebeat__b_r_rdy = bytebeat__b_r_load_en;
  assign bytebeat__c_r_rdy = bytebeat__c_r_load_en;
  assign bytebeat__d_r_rdy = bytebeat__d_r_load_en;
  assign bytebeat__output_s = __bytebeat__output_s_reg;
  assign bytebeat__output_s_vld = __bytebeat__output_s_valid_reg;
endmodule
