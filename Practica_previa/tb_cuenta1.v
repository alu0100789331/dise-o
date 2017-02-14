// Testbench ejemplo

//`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulación y el paso de simulación

module mimodulo_tb; //Declaracion de modulo del testbench


//declaracion de señales

reg clk_;//,start_,fin_
reg start_;
wire fin_;
wire [3:0] salida_;
reg [2:0] entrada_;
//instancia del modulo a testear
cuenta1 mi_modulo(entrada_,start_,clk_,salida_,fin_);
always
  #5
  clk_ = !clk_;
initial
begin
  clk_ = 0;
  start_ = 1'b1;  
  entrada_ = 3'b000;
  #10
  start_ = 1'b0;

end
initial
begin
  $monitor("tiempo=%0d entrada_=%b salida_=%b start_=%b fin=%b clk=%b", $time, entrada_, salida_, start_, fin_,clk_);
  $dumpfile("mimodulo_tb.vcd");
  $dumpvars;

	//INICIO DE LA PRUEBA
	entrada_ = 3'b101;
  #100
  $finish;  //fin simulacion

end
endmodule

