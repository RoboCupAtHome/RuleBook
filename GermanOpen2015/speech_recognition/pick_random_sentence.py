#! /usr/bin/env python

import csv
import random

with open("speech_recognition_questions.csv") as f:
    reader = csv.DictReader(f, delimiter=";")

    questions = list(reader)

    q = random.choice(questions)

    # print q

    print q["Question"]
    print "----"
    print q["ANSWER"]