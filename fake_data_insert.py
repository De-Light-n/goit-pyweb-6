import sqlite3
from faker import Faker
import random

# Створюємо з'єднання з базою даних
conn = sqlite3.connect('data_base.sqlite')
cursor = conn.cursor()

# Ініціалізуємо Faker
faker = Faker("uk-UA")

# Створення даних для викладачів
teachers = []
for _ in range(5):
    teacher_name = faker.name()
    teachers.append((teacher_name,))

cursor.executemany("INSERT INTO teachers (name) VALUES (?)", teachers)
conn.commit()

# Отримуємо ID викладачів
cursor.execute("SELECT teacher_id FROM teachers")
teacher_ids = [row[0] for row in cursor.fetchall()]

# Створення даних для предметів
subjects = []
subject_names = ["Mathematics", "Physics", "History", "Literature", "Biology", "Chemistry", "Computer Science", "Art"]
for subject_name in random.sample(subject_names, 8):
    teacher_id = random.choice(teacher_ids)
    subjects.append((subject_name, teacher_id))

cursor.executemany("INSERT INTO subjects (name, teacher_id) VALUES (?, ?)", subjects)
conn.commit()

# Отримуємо ID предметів
cursor.execute("SELECT subject_id FROM subjects")
subject_ids = [row[0] for row in cursor.fetchall()]

# Створення даних для груп
groups = []
group_names = ["Group A", "Group B", "Group C"]
for group_name in group_names:
    groups.append((group_name,))

cursor.executemany("INSERT INTO groups (group_name) VALUES (?)", groups)
conn.commit()

# Отримуємо ID груп
cursor.execute("SELECT group_id FROM groups")
group_ids = [row[0] for row in cursor.fetchall()]

# Створення даних для студентів
students = []
for _ in range(50):
    student_name = faker.name()
    birthday = faker.date_of_birth(minimum_age=18, maximum_age=25)
    group_id = random.choice(group_ids)
    students.append((student_name, birthday, group_id))

cursor.executemany("INSERT INTO students (name, birthday, group_id) VALUES (?, ?, ?)", students)
conn.commit()

# Отримуємо ID студентів
cursor.execute("SELECT student_id FROM students")
student_ids = [row[0] for row in cursor.fetchall()]

# Створення даних для оцінок
grades = []
for student_id in student_ids:
    for _ in range(random.randint(15, 20)):
        subject_id = random.choice(subject_ids)
        grade = random.randint(60, 100)
        grades.append((grade, student_id, subject_id))

cursor.executemany("INSERT INTO grades (grade, student_id, subject_id) VALUES (?, ?, ?)", grades)
conn.commit()

# Закриваємо з'єднання
conn.close()
