module sifrelemeSistemi(
input butonA,
input butonB,
input clk,  //butonA > 0, butonB > 1 , 011<kırmızı 101<mavi  110<yeşil
output reg [2:0] led
);

reg [31:0] sayac = 32'd0;
reg [3:0] butonSayaci = 4'b0000;
reg [5:0] sifre;
reg [5:0] denenenSifre;
reg  sifreKaydetme = 1'b1;
reg  sifreDogrulama = 1'b0;
reg  butonuAlgila = 1'b1;
reg  dogru = 1'b0;
reg  yanlis = 1'b0;

always@(posedge clk)begin                           
if(sifreKaydetme == 1'b1) begin
    sayac <= sayac + 1;
    if(sayac == 32'd10000_000)begin
    led <= 3'b101;
    end
    else if(sayac == 32'd20000_000) begin
    led <= 3'b111;
    sayac <= 32'd0;
    end
end 
else if(sifreDogrulama == 1'b1) begin
    sayac <= sayac + 1;
    if(sayac == 32'd10000_000)begin
    led <= 3'b010;
    end
    else if(sayac == 32'd20000_000) begin
    led <= 3'b111;
    sayac <= 32'd0;
    end
end 
else if(dogru == 1'b1) begin
    led <= 3'b011;
end if(yanlis == 1'b1) begin
    led <= 3'b110;
end 
end 




always@(posedge clk)begin
    if(!butonA && butonB &&butonuAlgila == 1'b1)begin
        butonuAlgila <= 1'b0;
        if(sifreKaydetme == 1'b1)begin
            case (butonSayaci)
                4'b0000: begin 
                    sifre[0] <= 1'b0;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0001: begin 
                    sifre[1] <= 1'b0;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0010: begin 
                    sifre[2] <= 1'b0;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0011: begin 
                    sifre[3] <= 1'b0;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0100: begin 
                    sifre[4] <= 1'b0;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0101: begin 
                    sifre[5] <= 1'b0;
                    sifreKaydetme <= 1'b0;
                    sifreDogrulama <= 1'b1;
                    butonSayaci <= 4'b0000;
                    end
                endcase
            end
        else if(sifreDogrulama == 1'b1)begin
            case (butonSayaci)
                4'b0000: begin 
                    denenenSifre[0] <= 1'b0;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0001: begin 
                    denenenSifre[1] <= 1'b0;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0010: begin 
                    denenenSifre[2] <= 1'b0;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0011: begin 
                    denenenSifre[3] <= 1'b0;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0100: begin 
                    denenenSifre[4] <= 1'b0;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0101: begin    
                    sifreKaydetme <= 1'b0;
                    sifreDogrulama <= 1'b0;
                    denenenSifre[5] <= 1'b1;
                    if(sifre == denenenSifre)begin
                        dogru <= 1'b1;
                    end
                    else begin
                        yanlis <= 1'b1;
                    end
                    end
                endcase
            end
    end
    else if(!butonB && butonA && butonuAlgila == 1'b1)begin
        butonuAlgila <= 1'b0;
        if(sifreKaydetme == 1'b1)begin
            case (butonSayaci)
                4'b0000: begin 
                    sifre[0] <= 1'b1;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0001: begin 
                    sifre[1] <= 1'b1;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0010: begin 
                    sifre[2] <= 1'b1;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0011: begin 
                    sifre[3] <= 1'b1;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0100: begin 
                    sifre[4] <= 1'b1;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0101: begin 
                    sifre[5] <= 1'b1;
                    sifreKaydetme <= 1'b0;
                    sifreDogrulama <= 1'b1;
                    butonSayaci <= 4'b0000;
                    end
            endcase
        end
        else if(sifreDogrulama == 1'b1)begin
            case (butonSayaci)
                4'b0000: begin 
                    denenenSifre[0] <= 1'b1;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0001: begin 
                    denenenSifre[1] <= 1'b1;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0010: begin 
                    denenenSifre[2] <= 1'b1;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0011: begin 
                    denenenSifre[3] <= 1'b1;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0100: begin 
                    denenenSifre[4] <= 1'b1;
                    butonSayaci <= butonSayaci + 1;
                    end
                4'b0101: begin    
                    sifreKaydetme <= 1'b0;
                    sifreDogrulama <= 1'b0;
                    denenenSifre[5] <= 1'b1;
                    if(sifre == denenenSifre)begin
                       dogru <= 1'b1;
                    end
                    else begin
                       yanlis <= 1'b1;
                    end
                    end
                endcase
            end
    end
        if (butonA && butonB) begin
        butonuAlgila <= 1'b1;
    end
end
    
endmodule