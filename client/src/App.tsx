import { useEffect, useState } from "react";

function App() {
  const [apiStatus, setApiStatus] = useState("Checking...");

  useEffect(() => {
    fetch("/api/health")
      .then((response) => {
        if (!response.ok) throw new Error("API unavailable");
        return response.json();
      })
      .then((data) => setApiStatus(data.status))
      .catch(() => setApiStatus("Unavailable"));
  }, []);

  return (
    <main className="min-h-screen bg-slate-100 p-8 text-slate-900">
      <div className="mx-auto max-w-3xl">
        <h1 className="text-3xl font-bold">Textbook Exchange</h1>
        <p className="mt-3 text-slate-600">
          College textbook buying, selling, and trading.
        </p>
        <p className="mt-6">
          API status: <strong>{apiStatus}</strong>
        </p>
      </div>
    </main>
  );
}

export default App;