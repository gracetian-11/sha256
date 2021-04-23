module display_FPGA(finished, clock, reset, hash_value, A, B, C, D, E, F, G, an0, an1, an2, an3, an4, an5, an6, an7, done_LED);

    input clock, finished, reset;
    input [255:0] hash_value;

    output reg A, B, C, D, E, F, G;
    output reg an0, an1, an2, an3, an4, an5, an6, an7;
    output done_LED;

    assign done_LED = finished;

    //reg [19:0] big_counter;
    reg [19:0] counter;
    wire [1:0] segment_counter;

    always @(posedge clock or posedge reset)
    begin
        if (reset == 1) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
            end
    end
    assign segment_counter = counter[19:18];

    wire isRight;
    wire [255:0] right_hash, hash_value;
   // assign hash_value = 256'hB94D27B9934D3E08A52E52D7DA7DABFAC484EFE37A5380EE9088F7ACE2EFCDE9;
    assign right_hash = 256'hB94D27B9934D3E08A52E52D7DA7DABFAC484EFE37A5380EE9088F7ACE2EFCDE9;
    assign isRight = (hash_value == right_hash);
    
    reg isDone;
    always @(posedge clock)
    begin
        if (finished == 1 && reset != 1) begin
            isDone = 1;
        end
        if (reset == 1) begin
            isDone = 0;
        end
        if (finished == 0 && reset == 0 && isDone == 0) begin
            isDone = 0;
        end
        if (finished == 0 && reset == 0 && isDone == 1) begin
            isDone = 1;
        end
    end 

    always @(isDone)
    begin
        if (isRight == 1 && isDone == 1) begin
            case(segment_counter)
            2'b00: begin
                an0 = 1;
                an1 = 1;
                an2 = 1;
                an3 = 1;
                an4 = 1;
                an5 = 1;
                an6 = 1;
                an7 = 0;
                A = 1;
                B = 0;
                C = 0;
                D = 0;
                E = 1;
                F = 0;
                G = 0;
            end
            2'b01: begin
                an0 = 1;
                an1 = 1;
                an2 = 1;
                an3 = 1;
                an4 = 1;
                an5 = 1;
                an6 = 0;
                an7 = 1;
                A = 0;
                B = 1;
                C = 1;
                D = 0;
                E = 0;
                F = 0;
                G = 0; 
            end
            2'b10: begin
                an0 = 1;
                an1 = 1;
                an2 = 1;
                an3 = 1;
                an4 = 1;
                an5 = 0;
                an6 = 1;
                an7 = 1;
                A = 0;
                B = 1;
                C = 0;
                D = 0;
                E = 1;
                F = 0;
                G = 0;
                end
            endcase
        end
        if(isRight == 0 && isDone == 1) begin
            case(segment_counter)
            2'b00: begin
                an0 = 1;
                an1 = 1;
                an2 = 1;
                an3 = 1;
                an4 = 1;
                an5 = 1;
                an6 = 1;
                an7 = 0;
                A = 1;
                B = 1;
                C = 0;
                D = 1;
                E = 0;
                F = 1;
                G = 0;
                end
            2'b01: begin
                an0 = 1;
                an1 = 1;
                an2 = 1;
                an3 = 1;
                an4 = 1;
                an5 = 1;
                an6 = 0;
                an7 = 1;
                A = 1;
                B = 1;
                C = 0;
                D = 0;
                E = 0;
                F = 1;
                G = 0;
                end
            endcase
        end 
        else begin
            an0 = 1;
            an1 = 1;
            an2 = 1;
            an3 = 1;
            an4 = 1;
            an5 = 1;
            an6 = 1;
            an7 = 1;
            A = 1;
            B = 1;
            C = 1;
            D = 1;
            E = 1;
            F = 1;
            G = 1;
        end
    end

endmodule