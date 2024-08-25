# Classroom-Template

This repository serves as the template for the Student User Registry and Management System (SURMS) project. It includes the backend built with Django and the frontend built with React, along with documentation and deployment guides.

## Directory Structure

\\\
Classroom-Template/
├── backend/
│   ├── requirements.txt
│   ├── manage.py
│   ├── surms_backend/
│   │   ├── __init__.py
│   │   ├── settings.py
│   │   ├── urls.py
│   │   ├── wsgi.py
│   │   ├── asgi.py
│   │   ├── models.py
│   │   ├── views.py
│   │   ├── serializers.py
│   │   ├── api/
│   │   │   ├── __init__.py
│   │   │   ├── urls.py
│   │   │   ├── views.py
│   │   │   ├── serializers.py
│   │   ├── tests/
│   │   │   ├── __init__.py
│   │   │   ├── test_models.py
│   │   │   ├── test_views.py
│   ├── .env.example
├── frontend/
│   ├── public/
│   │   ├── index.html
│   │   ├── favicon.ico
│   ├── src/
│   │   ├── components/
│   │   │   ├── Header.js
│   │   │   ├── Footer.js
│   │   │   ├── Profile.js
│   │   │   ├── RegistrationForm.js
│   │   ├── App.js
│   │   ├── index.js
│   ├── package.json
│   ├── .env.example
├── docs/
│   ├── API_DOCUMENTATION.md
│   ├── SYSTEM_ARCHITECTURE.md
│   ├── DEPLOYMENT_GUIDE.md
├── .gitignore
├── README.md
├── LICENSE
\\\

## Getting Started

To get started with the SURMS project, follow these steps:

1. **Backend Setup**:
    - Navigate to the \ackend/\ directory.
    - Install the required dependencies using \pip install -r requirements.txt\.
    - Set up your environment variables using the \.env.example\ file.

2. **Frontend Setup**:
    - Navigate to the \rontend/\ directory.
    - Install the required dependencies using \
pm install\.
    - Set up your environment variables using the \.env.example\ file.

3. **Run the Application**:
    - Start the Django development server: \python manage.py runserver\.
    - Start the React development server: \
pm start\.

## Documentation

Refer to the [docs](docs/) directory for detailed API documentation, system architecture, and deployment guides.
