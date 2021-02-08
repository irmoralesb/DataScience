import numpy as np
import csv
import pandas as pd

# 2.1 Sort and get the range
numbers = np.array([17, 45, 38, 27, 6, 48, 11, 57, 34, 22])

# Sort
numbers.sort()
nrange = numbers.max() - numbers.min()
print("Numbers sorted: {0}".format(numbers))
print("Range is: {0}".format(nrange))

# 2.2 Grades
grades = []
with open("../data/grades.txt", 'r') as fr:
    reader = csv.reader(fr)
    for row in reader:
        grades = row

# grades = np.array(grades)
print("{0}".format(grades))
grades = np.array(grades, dtype=int)
grades.sort()

# a) La calificación más alta.
print("Max: {0}".format(grades.max()))
# b) La calificación más baja.
print("Min: {0}".format(grades.min()))
# c) El rango.
print("Range: {0}".format(grades.max() - grades.min()))
# d) Las calificaciones de los cinco mejores estudiantes.
print("Top 5: {0}".format(grades[-5:][::-1]))
# e) Las calificaciones de los cinco peores estudiantes.
print("Last 5: {0}".format(grades[1:5]))
# f) La calificación del alumno que tiene el décimo lugar entre las mejores calificaciones.
print("Grade # 10: {0}".format(grades[-10]))
# g) El número de estudiantes que obtuvieron 75 o más.
print("Count grade of 75+: {0}".format(sum(grades >= 75)))
# h) El número de estudiantes que obtuvieron 85 o menos.
print("Count grade of 85-: {0}".format(sum(grades < 85)))
# i) El porcentaje de los estudiantes que obtuvieron calificaciones mayores a 65 pero no mayores a 85.
result = sum(grades <= 85) - sum(grades <= 65) / len(grades)
print("% Students 65 > x < 85: {0}".format(result))

# Frequency Table
bins = pd.IntervalIndex.from_tuples([(50, 54), (54, 59), (59, 64), (64, 69), (69, 74), (74, 79), (79, 84), (84, 89),
                                    (89, 94), (94, 100)])
group_grades = pd.cut(grades, bins)
print("{0}".format(group_grades.value_counts()))
