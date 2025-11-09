from django.test import TestCase

# Create your tests here.
from django.test import TestCase

class HelloUserTest(TestCase):
    def test_hello_message(self):
        response = self.client.get('/api/hello/')
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, "Welcome to Django CI/CD Demo!")