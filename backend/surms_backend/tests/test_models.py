from django.test import TestCase
from ..models import Student

class StudentModelTest(TestCase):
    def test_string_representation(self):
        student = Student(github_username='testuser')
        self.assertEqual(str(student), student.github_username)
