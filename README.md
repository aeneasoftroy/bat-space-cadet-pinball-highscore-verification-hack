# space-cadet-pinball-highscore-verification-hack
In order to get the highscore table to be accepted by the program, we must re-calculate the verification code in the registry. 

This code is calculated by adding up all score on the table, substracting the negative values of empty highscore places, convert the highscore name to decimal values and add those to the total.

![alt text](https://github.com/aeneasoftroy/bat-space-cadet-pinball-highscore-verification-hack/blob/master/Space%20Cadet%20Pinball%20Hacking%202.png)

This script has the negative values of 4 empty highscore entries (-999x4=-3996), therefor it only affects the number 1 player on the chart. After that, we take all the characters of the name of the highscore table entry, and convert those characters into decimals, add those up to what we have and there is the verification code we require to validate the highscore.

![alt text](https://github.com/aeneasoftroy/bat-space-cadet-pinball-highscore-verification-hack/blob/master/Space%20Cadet%20Pinball%20Hacking%203.png)

  - Aeneas of Troy
