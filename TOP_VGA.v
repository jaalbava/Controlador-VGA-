`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
// En el top se incluyen el bloque sincronizador y el generador de pixeles
//determinando asi la salida rgb, vsync y hsync, generando los colores y 
// letras en pantalla.
module TOP_VGA(
    input wire clk, reset,
    input swt1,swt2,swt3,
    output wire vsync, hsync,
    output wire[2:0] rgb
//	 output wire font_bit //agregada para prueba
    );

// declaración de registro de colores
wire [9:0] pixel_x; 
wire [9:0] pixel_y;
wire video_on; 
wire pixel_tick;
reg [2:0] rgb_reg;
wire [2:0] rgb_next;


//Instanciación de funciones principales
vga_sync vga_sync(
		.clk(clk), 
		.reset(reset), 
		.hsync(hsync), 
		.vsync(vsync), 
		.video_on(video_on), 
      .p_tick(pixel_tick),		
		.pixel_x(pixel_x), 
		.pixel_y(pixel_y)
		);
	

// Instantiate the module
font_test_gen font_test_gen  (
    .clk(clk), 
    .video_on(video_on), 
    .pixel_x(pixel_x), 
    .pixel_y(pixel_y), 
	 .swt1(swt1), 
	 .swt2(swt2), 
	 .swt3(swt3),
	 .rgb_text(rgb_next)
    );
	 
	 // rgb buffer
   always @(negedge clk)
      if (pixel_tick)
         rgb_reg <= rgb_next;
   // output
   assign rgb = rgb_reg;
	 
endmodule 