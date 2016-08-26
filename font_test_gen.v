`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module font_test_gen(
   input wire clk,
   input wire video_on,
   input wire [9:0] pixel_x, pixel_y,
	input swt1, swt2, swt3,
	output reg [2:0] rgb_text,
	output wire font_bit

    );

   // signal declaration
	wire [10:0] rom_addr;
   reg [6:0] char_addr;
   wire [3:0] row_addr; //antes era [3:0]
   wire [2:0] bit_addr;
   wire [7:0] font_word;
//	reg casiy; //tratando manipular condicion

   // body
   // instantiate font ROM
   font_rom font_unit
      (.clk(clk), .addr(rom_addr), .data(font_word));

   // font ROM interface
 //  assign char_addr = {pixel_y[5:4], pixel_x[7:3]};
   assign row_addr = pixel_y[3:0];
   assign rom_addr = {char_addr, row_addr};
   assign bit_addr = pixel_x[2:0];
   assign font_bit = font_word[~bit_addr];
	assign casiy = pixel_y[9:4];
		
   // region delimitada para el texto
 //  assign text_bit_on = (pixel_y[9:7]==2) && //Me determina el lugar donde se proyectaran las iniciales
 //                   (26<=pixel_x[9:3]) && (pixel_x[9:3]<=29);
						  						  
	always @*
	
//		if (casiy==6'hf)
//			begin
      case(pixel_x[8:3])
         6'h25: char_addr = 7'h4a; // J
         6'h27: char_addr = 7'h4d; // M
			6'h29: char_addr = 7'h47; // G
         default: char_addr = 7'h00; //espacio en blanco
      endcase
//			end
	
	

   // rgb multiplexing circuit
   always @*
      if (~video_on) //se cambia a rojo
         rgb_text = 3'b100; // zona prohibida
      else
			begin
				if (font_bit) //hay que pintar pixel letra
					begin
					rgb_text[2]=swt1;
					rgb_text[1]=swt2;
					rgb_text[0]=swt3;//swt1 //color escogido
					end
				else
					begin
					rgb_text=3'b100; //mismo color del fondo de pantalla
					end
			end

endmodule
