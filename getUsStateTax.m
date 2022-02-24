function tax_total = getUsStateTax(income, status)

% ref: 2021-540-tax-rate-schedules.pdf  or get from: https://www.ftb.ca.gov/forms/Search/Home/FormRequest/4798
standard_deduction = 0;

if(strcmp(status, "Married"))
% [bar, tax_rate_above_bar]
tax_brackets = [
0, 0.01
18650, 0.02
44214, 0.04
69784, 0.06
96870, 0.08
122428, 0.093
625372, 0.103
750442, 0.113
1250738, 0.123
];
elseif(strcmp(status, "HeadOfHousehold"))
% [bar, tax_rate_above_bar]
tax_brackets = [
0, 0.01
18663, 0.02
44217, 0.04
56999, 0.06
70542, 0.08
83324, 0.093
425251, 0.103
510303, 0.113
850503, 0.123
]; 
else
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
]; 
end

income = income - standard_deduction;

tax_total = getTax(income, tax_brackets);

endfunction
