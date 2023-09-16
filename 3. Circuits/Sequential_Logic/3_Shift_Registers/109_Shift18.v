module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input signed [63:0] data,
    output reg signed [63:0] q); 

    always @(posedge clk) begin
        if (load) q <= data;
        else if (ena)
            case (amount)
                2'b00: q <= q <<< 1;
                2'b01: q <= q <<< 8;
                2'b10: q <= q >>> 1;
                2'b11: q <= q >>> 8;
                default: q <= q;
            endcase
    end
endmodule
