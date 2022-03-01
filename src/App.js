import logo from './ci.png';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p className="title">Sun* CI</p>
        <p>Continuous Integration & Continuous Deployment</p>
        <a
          className="App-link"
          href="https://ci.sun-asterisk.com/docs/introduction/"
          target="_blank"
          rel="noopener noreferrer"
        >
          Get Started
        </a>
      </header>
    </div>
  );
}

export default App;
