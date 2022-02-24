function tax_total = getChinaTax(income)
  
standard_deduction = 5000*12; % 5000 per month
% [bar, tax_rate_above_bar]
tax_brackets = [
0, 0.03
36000, 0.1
144000, 0.2
300000, 0.25
420000, 0.3
660000, 0.35
960000, 0.45
]; % ref: http://www.chinatax.gov.cn/chinatax/n810219/n810744/n3752930/n3752974/c3970366/content.html

income = income - standard_deduction;

tax_total = getTax(income, tax_brackets);
endfunction
