function tax_total = getUsFederalTax(income)
% [bar, tax_rate_above_bar]
tax_brackets = [
0, 0.1,
9950, 0.12
40525, 0.22
86375, 0.24
164925, 0.32
209425, 0.35
523600, 0.37 
]; % ref: https://www.irs.gov/newsroom/irs-provides-tax-inflation-adjustments-for-tax-year-2021

tax_total = getTax(income, tax_brackets);

endfunction
