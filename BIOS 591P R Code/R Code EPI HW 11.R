#Hpmework 11 R Code. Kemi Bakare #

#A4 P-value#
1-pbinom(791,1315,67547/134693)

#A5#
1-pnorm(792, 1315*67547/134693, sqrt(1315*67547/134693*67146/134693))

#A6#
binom.test(792,1315)$conf.int

