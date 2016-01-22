sentence = "Humpty Dumpty sat on a wall."
words=sentence.split(//)
words.reverse!
backward_sentence=words.join(' ') + '.'
p(backward_sentence)
 


