`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2025 20:38:12
// Design Name: 
// Module Name: apb_slave
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



`timescale 1ns / 1ps

module app_slave(
    input pclk,
    input presetn,
    input pwrite,
    input pselx,
    input penable,
    input [7:0] paddr,
    input [7:0] pwdata,
    output wire [7:0] prdata,
    output reg pready
);

    reg [7:0] mem [0:255];
    reg [7:0] rdata;

    assign prdata = rdata;

    always @(*) begin
        if (!presetn) begin
            rdata = 8'h00;
            pready = 0;
        end else begin
            if (pselx && penable) begin
                pready = 1;
                if (pwrite)
                    mem[paddr] = pwdata;
                else
                    rdata = mem[paddr];
            end else begin
                pready <= 0;
            end
        end
    end

endmodule