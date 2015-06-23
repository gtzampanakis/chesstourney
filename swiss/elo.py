import math

K = 16. # The higher this is, the more effective is a single position to a user's rating.
KP = 400.

def phi(x):
	'Cumulative distribution function for the standard normal distribution'
	return (1.0 + math.erf(x / math.sqrt(2.0))) / 2.0

def match_increment(p1_rating, p2_rating, p_observed):
	rdiff = p1_rating - p2_rating
	p_from_rating = phi(rdiff / KP)
	surplus = p_observed - p_from_rating
	result = K * surplus
	return result
	
if __name__ == '__main__':
	for i in xrange(100):
		print match_increment(1500., 1500., .002)
