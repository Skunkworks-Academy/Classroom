import React from 'react';
import Header from './components/Header';
import Footer from './components/Footer';
import Profile from './components/Profile';
import RegistrationForm from './components/RegistrationForm';

function App() {
    return (
        <div>
            <Header />
            <RegistrationForm />
            <Profile />
            <Footer />
        </div>
    );
}

export default App;
