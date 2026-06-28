const express = require("express");
const os = require("os");

const app = express();

app.use(express.static("public"));

app.get("/api/info", (req, res) => {
    res.json({
        application: "Cloud Native Kubernetes Lab",
        hostname: os.hostname(),
        namespace: process.env.NAMESPACE || "local",
        version: process.env.VERSION || "1.0.0",
        environment: process.env.ENVIRONMENT || "development",
        time: new Date().toLocaleString()
    });
});

app.listen(3000, () => {
    console.log("Server running on port 3000");
});