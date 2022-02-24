clear all;
close all;

income_vec = 1:100:1000000;

remain_percentage_us = zeros(1,size(income_vec,2));
remain_percentage_us_state = zeros(1,size(income_vec,2));
remain_percentage_us_federal = zeros(1,size(income_vec,2));
remain_percentage_cn = zeros(1,size(income_vec,2));

for i = 1:size(income_vec,2)
  
  % US
  income = income_vec(i);
  tax_total_state = getUsStateTax(income);
  remain_percentage_us_state(i) = (1- tax_total_state/income);
  
  income = income_vec(i);
  tax_total_federal = getUsFederalTax(income);
  remain_percentage_us_federal(i) = (1- tax_total_federal/income);
  
  remain_percentage_us(i) = (1- (tax_total_state+tax_total_federal)/income);
  
  % China
  tax_total = getChinaTax(income);
  remain_percentage_cn(i) = (1- tax_total/income);
endfor

figure()
plot(income_vec,remain_percentage_us)
hold on
plot(income_vec,remain_percentage_us_state)
plot(income_vec,remain_percentage_us_federal)
plot(income_vec,remain_percentage_cn)
legend("us", "us-state", "us-federal", "cn")
xlabel("income")
ylabel("remain percentage")


