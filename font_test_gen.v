`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module font_test_gen(
    input wire clk,
    input wire video_on,
    input wire [9:0] pixel_x, pixel_y,
	 input wire [2:0] color_rgb,
    output reg [2:0] rgb_text
    );

   // signal declaration
   wire [10:0] rom_addr;
   reg [6:0] char_addr;
   wire [3:0] row_addr;
   wire [2:0] bit_addr;
   wire [7:0] font_word;
   wire font_bit, text_bit_on;
	wire [2:0] px_color;

   // body
   // instantiate font ROM
   font_rom font_unit
      (.clk(clk), .addr(rom_addr), .data(font_word));
		
	//instanciando deco colores
color_case lcolor (
    .color_rgb(color_rgb), 
    .px_color(px_color)
    );
		
		
   // font ROM interface
 //  assign char_addr = {pixel_y[5:4], pixel_x[7:3]};
   assign row_addr = pixel_y[3:0];
   assign rom_addr = {char_addr, row_addr};
   assign bit_addr = pixel_x[2:0];
   assign font_bit = font_word[~bit_addr];
	
		
   // region delimitada para el texto
   assign text_bit_on = (pixel_y[9:5]==15) && //Me determina el lugar donde se proyectaran las iniciales
                    (38<=pixel_x[9:3]) && (pixel_x[9:3]<=40);
						  
	always @*
      case(pixel_x[8:3]) //falta usar otras posibilidades
         6'h26: char_addr = 7'h4a; // J
         6'h27: char_addr = 7'h4d; // M
			6'h28: char_addr = 7'h47; // G
         default: char_addr = 7'h00; //espacio en blanco
      endcase
								

   // rgb multiplexing circuit
   always @*
      if (~video_on)
         rgb_text = 3'b000; // zona prohibida color negro
      else
			begin
				if (text_bit_on) //hay que dibujar letra
					begin
					if (font_bit) //hay que pintar pixel letra
						begin
						rgb_text=px_color; //color escogido
						end
					else
						begin
						rgb_text=3'b011; //mismo color del fondo de pantalla
						end
					end
				else
					begin
					rgb_text=3'b011; //color fondo de pantalla cyan
					end
			end
				

endmodule
