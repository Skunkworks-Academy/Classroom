import React, { useState } from 'react';

function RegistrationForm() {
    const [formData, setFormData] = useState({
        github_username: '',
        email: '',
        full_name: ''
    });

    const handleChange = e => {
        setFormData({
            ...formData,
            [e.target.name]: e.target.value
        });
    };

    const handleSubmit = e => {
        e.preventDefault();
        // Post form data to backend API
        fetch('/api/students/', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData),
        })
        .then(response => response.json())
        .then(data => console.log(data));
    };

    return (
        <form onSubmit={handleSubmit}>
            <label>
                GitHub Username:
                <input type=\"text\" name=\"github_username\" onChange={handleChange} value={formData.github_username} />
            </label>
            <br />
            <label>
                Email:
                <input type=\"email\" name=\"email\" onChange={handleChange} value={formData.email} />
            </label>
            <br />
            <label>
                Full Name:
                <input type=\"text\" name=\"full_name\" onChange={handleChange} value={formData.full_name} />
            </label>
            <br />
            <button type=\"submit\">Register</button>
        </form>
    );
}

export default RegistrationForm;
