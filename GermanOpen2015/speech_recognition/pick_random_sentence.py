#! /usr/bin/env python

import csv
import random
from collections import OrderedDict
import pprint

answering = OrderedDict()

with open("speech_recognition_questions.csv") as f:
    reader = csv.DictReader(f, delimiter=";")

    questions = list(reader)
    random.shuffle(questions)

    for direct in range(5):
        question_index = direct + 1
        q = questions.pop()
        dict_key = "{0}: {1}".format(question_index, q["Question"])

        print "Question {0}: {1}.   ----> {2}".format(question_index, q["Question"], q["ANSWER"])
        key = raw_input("Correct answer? c = correct, i = incorrect: ")

        if key == "c":
            answering[dict_key] = 10
        elif key == "i":
            answering[dict_key] = 0
        else:
            print "Key not allowed"


        print answering
        print "-" * 20
        print

    print "#" * 20

    for indirect in range(5):
        question_index = indirect + 1
        q = questions.pop()

        dict_key = "{0}: {1}".format(question_index, q["Question"])

        print "Question {0}: {1}.   ----> {2}".format(question_index, q["Question"], q["ANSWER"])
        key = raw_input("Correct answer? c = correct, i = incorrect, r = repeat: ")
        if key == "c":
            answering[dict_key] = 20
        elif key == "i":
            answering[dict_key] = 0
        elif key == "r":
            print "Question {0}m, 2nd attempt: {1}.   ----> {2}".format(question_index, q["Question"], q["ANSWER"])
            key = raw_input("Correct answer in 2nd attempt? c = correct, i = incorrect: ")
            if key == "c":
                answering[dict_key] = 10
            elif key == "i":
                answering[dict_key] = 0
            else:
                print "Key not allowed"
        else:
            print "Key not allowed"

        print answering
        print "-" * 20
        print

    pprint.pprint(answering)
    print "-" * 20, "+"


    total_score = sum(answering.values())
    print "TOTAL SCORE: {0}".format(total_score)


    