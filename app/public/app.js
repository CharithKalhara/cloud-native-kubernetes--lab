fetch("/api/info")
.then(response => response.json())
.then(data => {

    document.getElementById("application").textContent = data.application;
    document.getElementById("hostname").textContent = data.hostname;
    document.getElementById("namespace").textContent = data.namespace;
    document.getElementById("version").textContent = data.version;
    document.getElementById("environment").textContent = data.environment;
    document.getElementById("time").textContent = data.time;

});