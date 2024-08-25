import React, { useState, useEffect } from 'react';

function Profile() {
    const [student, setStudent] = useState(null);

    useEffect(() => {
        // Fetch student profile from backend API
        fetch('/api/students/1/')
            .then(response => response.json())
            .then(data => setStudent(data));
    }, []);

    if (!student) return <p>Loading...</p>;

    return (
        <div>
            <h2>{student.full_name}</h2>
            <p>GitHub: {student.github_username}</p>
            <p>Email: {student.email}</p>
        </div>
    );
}

export default Profile;
