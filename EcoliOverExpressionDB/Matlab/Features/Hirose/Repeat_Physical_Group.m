function [ repeat_physical_s ] = Repeat_Physical_Group( repeat_AA_s )
%--------------------------------------------------------------------------
%Repeat: maximum number of consecutive same physical property groups

number_of_proteins = size(repeat_AA_s,1);

repeat_physical_s = zeros(number_of_proteins,5);

for i=1:number_of_proteins
    
    repeat_physical_s(i,1) = max([... 
                                 repeat_AA_s(i,AAtoCode('G')) ,...
                                 repeat_AA_s(i,AAtoCode('A')) ,...
                                 repeat_AA_s(i,AAtoCode('L')) ,...
                                 repeat_AA_s(i,AAtoCode('V')) ,...
                                 repeat_AA_s(i,AAtoCode('I')) ,...
                                 repeat_AA_s(i,AAtoCode('P')) ...
                                 ]);
                                 
    repeat_physical_s(i,2) = max([... 
                                 repeat_AA_s(i,AAtoCode('F')) ,...
                                 repeat_AA_s(i,AAtoCode('W')) ,...
                                 repeat_AA_s(i,AAtoCode('Y')) ...
                                 ]);
                                 
    repeat_physical_s(i,3) = max([... 
                                 repeat_AA_s(i,AAtoCode('S')) ,...
                                 repeat_AA_s(i,AAtoCode('T')) ,...
                                 repeat_AA_s(i,AAtoCode('C')) ,...
                                 repeat_AA_s(i,AAtoCode('M')) ,...
                                 repeat_AA_s(i,AAtoCode('N')) ,...
                                 repeat_AA_s(i,AAtoCode('Q')) ...
                                 ]);
                                
    repeat_physical_s(i,4) = max([... 
                                 repeat_AA_s(i,AAtoCode('D')) ,...
                                 repeat_AA_s(i,AAtoCode('E')) ...
                                 ]);
                                
    repeat_physical_s(i,5) = max([... 
                                 repeat_AA_s(i,AAtoCode('R')) ,...
                                 repeat_AA_s(i,AAtoCode('K')) ,...     
                                 repeat_AA_s(i,AAtoCode('H')) ...
                                 ]);  
end

%--------------------------------------------------------------------------
end

