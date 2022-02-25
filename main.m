clear all;
close all;

income_vec = 1:100:2000000;

remain_percentage_us_single = zeros(1,size(income_vec,2));
remain_percentage_us_married = zeros(1,size(income_vec,2));
remain_percentage_us_hoh = zeros(1,size(income_vec,2));
remain_percentage_cn = zeros(1,size(income_vec,2));

for i = 1:size(income_vec,2)
  income = income_vec(i);
  
  % US
  tax_total_state = getUsStateTax(income, "Single");
  tax_total_federal = getUsFederalTax(income, "Single");
  remain_percentage_us_single(i) = (1- (tax_total_state+tax_total_federal)/income);
  
  tax_total_state = getUsStateTax(income, "Married");
  tax_total_federal = getUsFederalTax(income, "Married");
  remain_percentage_us_married(i) = (1- (tax_total_state+tax_total_federal)/income);
  
  tax_total_state = getUsStateTax(income, "HeadOfHousehold");
  tax_total_federal = getUsFederalTax(income, "HeadOfHousehold");
  remain_percentage_us_hoh(i) = (1- (tax_total_state+tax_total_federal)/income);
  
  % China
  tax_total = getChinaTax(income);
  remain_percentage_cn(i) = (1- tax_total/income);
endfor

figure()
plot(income_vec,remain_percentage_us_single)
hold on
plot(income_vec,remain_percentage_us_married)
plot(income_vec,remain_percentage_us_hoh)
plot(income_vec,remain_percentage_cn)
legend("us-single", "us-married", "us-headOfHouse", "cn")
xlabel("income")
ylabel("remain percentage")
grid on;

