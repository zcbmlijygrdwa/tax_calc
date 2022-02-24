function tax_total = getUsStateTax(income)
% [bar, tax_rate_above_bar]
tax_brackets = [
0, 0.01
9325, 0.02
22107, 0.04
34892, 0.06
48435, 0.08
61214, 0.093
312686, 0.103
375221, 0.113
625369, 0.123
]; % ref: 2021-540-tax-rate-schedules.pdf  or get from: https://www.ftb.ca.gov/forms/Search/Home/FormRequest/4798

tax_total = getTax(income, tax_brackets);

endfunction
