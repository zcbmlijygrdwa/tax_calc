function tax_total = getUsFederalTax(income, status)
% ref: https://www.nerdwallet.com/article/taxes/federal-income-tax-brackets
  
if(strcmp(status, "Married"))
standard_deduction = 25100;
% [bar, tax_rate_above_bar]
tax_brackets = [
0, 0.1,
19900, 0.12
81051, 0.22
172751, 0.24
329851, 0.32
418851, 0.35
628301, 0.37 
];

elseif(strcmp(status, "HeadOfHousehold"))
standard_deduction = 18800;
% [bar, tax_rate_above_bar]
tax_brackets = [
0, 0.1,
14200, 0.12
54201, 0.22
86351, 0.24
164901, 0.32
209401, 0.35
523601, 0.37 
];

else
standard_deduction = 12550;
% [bar, tax_rate_above_bar]
tax_brackets = [
0, 0.1,
9950, 0.12
40525, 0.22
86375, 0.24
164925, 0.32
209425, 0.35
523600, 0.37 
];
end

income = income - standard_deduction;


tax_total = getTax(income, tax_brackets);

endfunction
