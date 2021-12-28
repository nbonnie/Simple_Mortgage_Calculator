# SIMPLE MORGAGE CALCULATOR

# init user variables
#

Price = 400000   # Total cost of property
P = 60000        # Principal investment (down payment)
interest_rate = 2.97   # Interest rate that your bank is offering you (varies based off credit score)
loan_period = 30       # Length of loan in years
HOA_Fees = 50          # MONTHLY HOA - If applicable 
Property_Taxes = 70    # Estimate MONTHLY property taxes based off state
Years_of_ownership = 5     # Estimate # of years you will own property


# END USER EDIATBLE VARIABLES
#

r = (interest_rate / 100) / 12
n = loan_period * 12
mon= matrix(0, length(seq(0,1,by=.05)))
tc = matrix(0, length(seq(0,1,by=.05)))
down = matrix(0, length(seq(0,1,by=.05)))

j = 1
for (i in seq(0,1,by=.05)) {
  loan = Price - ((1-i)*P)
  save = i*P
  monthly = loan * ( (r*((1+r)^n)) / (((1+r)^n) - 1 ) )  # P[r(1+r)^n/((1+r)^n)-1)] 
  monthly = monthly + HOA_Fees + Property_Taxes
  annual = monthly *12 * Years_of_ownership
  total_cost = annual - save
  
  down[j] = ((1-i)*P)
  mon[j] = monthly
  tc[j] = total_cost
  
  j = j + 1
}

df <- data.frame("down" = down, "monthly" = mon, "total" = tc)
print(df)

# Total is referring to the total amount of money you will pay in Years_of_ownership years. 
