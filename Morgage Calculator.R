# MINIMUM MORGAGE CALCULATOR
#
# For a sum of $60,000, what is the optimal down payment? 

# init variables
Price = 400000
P = 60000
r = (2.97 / 100) / 12
n = 30 * 12

mon= matrix(0, length(seq(0,1,by=.05)))
tc = matrix(0, length(seq(0,1,by=.05)))
down = matrix(0, length(seq(0,1,by=.05)))

j = 1
for (i in seq(0,1,by=.05)) {
  loan = 400000 - ((1-i)*P)
  save = i*P
  monthly = loan * ( (r*((1+r)^n)) / (((1+r)^n) - 1 ) )  # P[r(1+r)^n/((1+r)^n)-1)] 
  monthly = monthly + 263 + 66
  annual = monthly *12 * 5
  total_cost = annual - save
  
  down[j] = ((1-i)*P)
  mon[j] = monthly
  tc[j] = total_cost
  
  j = j + 1
}

df <- data.frame("down" = down, "monthly" = mon, "total" = tc)


