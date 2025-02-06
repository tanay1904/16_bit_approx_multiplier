// moves all partial products into a wallace tree like array

module par_mul #(parameter N = 4) (
input rst, clk, load,
input reg [N-1:0] B, A,
output reg [16-1:0][ 2 * 16 - 2 : 0 ] WT,
output integer k
);
reg [N-1:0] tA;
reg [N-1:0] tB;
integer l;
//initialisation of variables
initial begin
    k = 0;
    l = 0;
    tA = 0;
    tB = 0;
end
//assigning A&B into WT
always @(posedge clk) begin
// resets all memory
if (rst) begin
  tA <= 'b0;
  tB <= 'b0;
  k <= 0;
  l <= 0;
end
end
  always@(*)begin
    if(rst)begin
      WT<='b0;
      {k,l} <= 'b0;
      end
else if (load) begin
    tA <= A;
    tB <= B;
  end
     else begin
      for (k = 0; k < 2 * N - 1; k++) begin
          if (k <= N-1) begin
            for (l = 0; l <= k; l++) WT[N-1-l][16-N+k] = tA[l] & tB[k-l];
          end else if (k>N-1) begin
            for (l = 0 ; l <= 2 * (N-1) - k; l = l + 1) WT[N-1-l][16-N+k] = tA[N-1-l] & tB[k-N+1+l];
            end
        end
      end
     end   
endmodule

   //else begin //inserts the incoming serial values into a SISO register
     //if (j < N+2) begin
      // tA <= {SINA,tA[N-1:1]};
      // tB <= {SINB,tB[N-1:1]};
    //    j <= j + 1;
  //  end
//     else j <= j;
    
    //assigns the Partiall products into Wallace tree orientation
 /*   if (!rst && j == N + 2) begin
        if (k < 2 * N - 1) begin
            if (k <= N-1) begin
                if (l <= k) begin
                  WT[N - 1 - l][16 - N + k] <= tA[l] & tB[k - l];
                  
                    l <= l + 1;
                  $display("<--------l check if l= %0d",l);
                end else if(l > k)begin
                  l <= 'b0;
                end
               //l <= 'b0;
            end
            else 
        end
              if (l <= 2 * (N-1) - k) begin
                WT[N - 1 - l][16 - N + k] <= tA[N - 1 - l] & tB[k - N + 1 + l];
                    l <= l + 1;
                $display("<--------l check else l=%0d",l);
              end else if(l > 2 * (N-1) - k)begin
                l <= 'b0;
              end
            k <= k + 1;
          $display("<--------l check else k=%0d",k);
            //l <= 0;
        end
    end*/
    
     /*if (j == N + 2 ) begin
       for (k = 0; k <=  2 * N  ; k = k + 1) begin
         $display("<--------l check else k=%0d",k);
    if (k <= N-1) begin
        for (l = 0 ; l <= k; l = l + 1) begin
            WT[N - 1 - l][16 - N + k] <= tA[l] & tB[k - l];
          $display("<--------l check else l=%0d",l);
        end
    end
    else begin
      for (l = 0 ; l <= 2 * (N-1) - k; l = l + 1) begin
            WT[N - 1 - l][16 - N + k] <= tA[N - 1 - l] & tB[k - N + 1 + l];
        $display("<--------l check else l=%0d",l);
        end
    end
         if (k == 2 * N ) j = j + 1;
end
     end*/
      //if(k <  2 * N - 1)begin
        /*if(k <= N-1) begin
          WT[N - 1 - l][16 - N + k] <= tA[l] & tB[k - l];
            //$display("<-------k = %d, l = %d", k , l);
          //$display("<------- WT = %d", WT[N - 1 - l][16 - N + k]);
          if(l != k)begin
            l <= l+1;
        end else begin
          l <= 'b0;
          k <= k+1;
      end
        else if (k > N-1)begin
          WT[N - 1 - l][16 - N + k] <= tA[N - 1 - l] & tB[k + 1 + l - N];
            //$display("<-------k = %d, l = %d", k,l);
          //$display("<------- WT = %d", WT[N - 1 - l][16 - N + k]);
          if(l != 2 * (N-1) - k)begin
          l <= l+1;
        end else begin
          l <= 'b0;
          k <= k+1;
        end
      end
    end
        else begin     
        k <= k;
      end*/
       //end
  
//------------
  // l is independent of clk
//------------  
  /*
  always @(*)begin
    if(l > k)begin
      l = 0;
    end else if(l > 2 * (N-1) - k) begin
      l = 0;
    end
  end
  */
