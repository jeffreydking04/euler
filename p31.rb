class CoinCombinationCounter
  def initialize(denominations = [1,2,5,10,20,50,100,200])
    @values = denominations.sort
  end

  def count_combinations(amount)
    combos(amount, @values.size - 1)
  end

  def combos(amount, index)
    return 0 if amount < 0
    return 1 if index == 0 
    (return combos(amount, index - 1) + combos(amount - @values[index], index)) if amount >= 0
  end

  private :combos
end

p_31_counter = CoinCombinationCounter.new
puts p_31_counter.count_combinations(6)


# I needed to troll the web for this one. And although I found an answer there
# that basically this is a copy of, I spent hours dissecting it.  I found
# another method that recursively worked up from all pennies and kept returning to
# previous states, trying to add larger coins, rejecting the results, and 
# returning to next previous state. It would display all unique combinations,
# but curiously, it did not count the states.  I tried to modify the program
# to count states, but because it continuously returned to previous states, I
# could not get a count to persist.  (I suppose I could have declared a counter
# class that instantiated each time a state was found and kept track of its instantiations,
# then simply outputted the count, but I was trying to pass the count in the 
# recursive method calls, but the reversion to previous states negated my efforts).
# In any case, I believe this approach to be far more elegant.  It is a thing of beauty
# quite frankly, and it brings tears to my eyes even though I did not conceive of it.
# I am guessing that the person I copied it from did not conceive of it either.  Whoever
# did has my undying gratitude, because this method of counting unique states is simply
# stunning.  I believe I am a decently intelligent human being, but my brain still boggles
# at exactly what this is doing.  I will attempt to explain it here, for my
# own peace of mind and my future self.  

# I will leave it to the reader to parse the actual syntax above but it is not
# complex.  Basically we are counting states.  A value is passed into the counter.  This 
# could have been collapsed into a single function, but this makes more sense from the
# user's standpoint.  The user just needs to instantiate the class with an array of denominations
# (I used the problem's values as the default) and then call the public method with the 
# amount we wish to find the number of unique coin combinations for.  
# 
# The private method takes two values, the amount to be considered and the denomination
# value to consider.  On each call, we can consider that iteration of the method to 
# to do two things.  As long as the denomination is not at the penny level, each 
# denomination level basically says, "Hey, there are stats that do not need
# this denomination value, so we need to count those states separately." So it simply 
# passes the full amount down to the next denomination level. This trickles all
# the way down  until it reaches the pennies.

# Let us just suppose that we had wished to know what happened
# if we had called the public method with an amount 5.  Now we know that the answer is 
# is 4 states for this problem: 5 pennies, 1 two-pence and 3 pennies, 2 two-pence
# and 1 penny, 1 nickel. 

# The first call has values 5 and 5. It passes the full value down to level 2, which
# passes the full value down to level 1, which says, "Okay, I am 5 pennies, so I return 1"
# which really just means that 5 pennies is one way to represent 5 cents.  This call
# to the penny level has no idea it represents the full amount.  It does not matter.
# The penny level just says, "I am the most basic way to represent this amount,
# there are no levels below me to pass the value to, so I represent 1 state of this
# amount, so I return 1."

# Now, the two-pence level received a request to process 5 cents.  It said, "Well, 
# I am not the most basic level, so there is a way to represent 5 cents without me"
# So it passed the 5 cents on to the penny level to say, "Here, you figure out how
# many unique states you can represent 5 cents in without me."  And the penny level
# can only do it in one way, so it returns 1 as we have seen.

# But method makes two calls.  One, as we have seen, just passes along the value to 
# the next level.  In a way, it is saying, there are jobs here of which I am no part
# other levels need to handle those jobs, so I am delegating the responsibility.

# However the second call says, "However, there may, or may not, be states that 
# include the instances of the current level."  In the case of 5 cents, there are two 
# states that include a two-pence.  Interestingly, the method does not check to see
# if the denomination value (an instance of that level) is actually needed in a 
# valid combination. It just assumes that it is needed and takes responsibility by 
# removing the level value from the total amount.  It is essentially saying, "I am
# taking responsibility for two-pence here.  If there is a state requiring two-pence
# then here is where I will stand up and take that 2 cents from the amount passed to
# me."  But, as for the other 3 cents, it takes no account.  And this is necessary, 
# because we need to figure out all the ways we can represent 5 cents using exactly 1
# two-pence.  Taking more would be jumping the gun.  

# So the two-pence level essentially takes 2 cents off the top and says it owns that 
# 2 cents, then says, let's figure out how many states the remainder can be configured 
# into.  It takes into account that it might require more two-pence than it has already
# taken account of and it also trusts that any higher levels were accounted for earlier
# in the recursion, so it calls back to the same two-pence level, but with only the 3
# cents left.

# Now, the two-pence level receives a request: Figure out how many unique states represent
# a valid coin combination for 3 cents.   It immediately passes along the 3 cents, knowing
# that there are combinations that do not include a two-pence.  The penny level is called
# with an amount of 3 cents and it says, "I can make exactly 1 combination representing 3 cents
# and that is 3 pennies, so I return 1."  

# I believe that to understand this recursion approach, it is crucial that we
# understand what is happening right here.  We are adding 1 to the total.  What 
# does this 1 represent?  It specifically represents the state: 1 two-pence and
# 3 pennies.  The two-pence level took away 2 cents and the penny level took responsibility
# for the rest.

# Now it gest easier:  When we called the two-pence level with 3 cents, it also took
# responsibility for yet another 2 cents and called itsefl with an amount of 1.
# The 1 was immediaely passed to the penny level, which returned 1.  This 1 was added
# to the total and it represents 2 two-pence and 1 penny.  We are almost there.

# The call to the two-pence level with amount 1 also resulted in the two-pence level
# taking another 2 cents from the total.  You see the method always passes the full
# amount to the next level and takes exactly one instance of its own value and passes
# that back to itself.  So the two-pence level takes yet another 2 cents from the 
# amount and passes -1 back to itself.  Well, neat story:  The next iteration at
# the two-pence level takes that -1 and says, this is a bunch of hooey. We cannot
# do anything with a negative value and it immediately returns 0, and so a state
# that includes 3 two-pence is rejected  as a valid state for 5 cents.

# So we are here.  When we originally called the method, we called 5 cents at the 
# nickel level (actually much high up, but it was simply passed down), and the
# 5 cent level passed it along by calling the two-pence level with amount 5, saying,
# "You go figure out what you can do without me" and it did, returning 3 unique
# valid states that represent 5 cents.  It also took a nickel out of the amount
# and called itself back again, with amount 0.

# Now the 0 was used to call the two-pence level, which took 2 cents out and called 
# itself again and was again rejected, saying we cannot take 2 cents out of 0 cents,
# but here is a really vital part: it also passed 0 to the penny level, and the penny
# level said, "Well, there IS 1 combination I can make with 0 cents and that is 0
# pennies."  So it returns 1 and this 1 represents 1 nickel and 0 pennies.  Zero is 
# a valid input because 0 coins is a valid combination of coins to represent 0 cents.
# Negative numbers cannot be represented by non-negative values, so those are
# not valid input.  I do not bother to raise that error here because this is a one-off
# program only used by me.

# Finally the second iteration of the nickel level took 5 cents from 0 and 
# called back its own level with -5 cents and got a 0 return for no valid states.

# It is simply a matter of seeing that induction is at work here as we go to higher
# denominations (levels).  The same pattern repeats as many times as we need.  Each
# level passes on the full amount for computation of states that do include it and 
# takes responsibility for exactly 1 instance of its level and passes the reduced
# amount back to itself, where other valid states representing states that include
# that one instance of that level are computed and returned.

# Neat story.  Just as I do not know how I would count the number of states if
# I were listing the exact properties of each state (without trickery), I am not
# sure how I would list the states using this method, because the increment at
# the end of the function does not know what caused it to be called, it just returns
# 1 if the amount is non-negative.

# Lastly consider the case of 6 cents.  Nickel passes 6 cents to two-pence, which
# returns 4 valid, unique states.  Nickel passes 1 cent to nickel, which passes 
# 1  cent to two-pence, which returns 1 valid state and it passes -4 to nickel, which
# returns 0.