function tax_total = getTax(income, tax_brackets)

tax_total = 0;
for i = 1:size(tax_brackets,1)
  
  lower_bound = tax_brackets(i,1);
  
  if(income < lower_bound)
    break;
  end
  
  if(i==size(tax_brackets,1))
    tax = (income - lower_bound)*tax_brackets(i,2);
  else
    upper_bound = tax_brackets(i+1,1);
    if(income>=lower_bound && income < upper_bound)
      tax = (income - lower_bound)*tax_brackets(i,2);
    else
      tax = (upper_bound-lower_bound)*tax_brackets(i,2);
      
    end
  end
  tax_total = tax_total + tax;
endfor
endfunction
