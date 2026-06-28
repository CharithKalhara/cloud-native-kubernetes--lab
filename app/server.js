const express = require("express");
const os = require("os");

const app = express();

app.use(express.static("public"));

app.get("/api/info", (req, res) => {
    res.json({
        application: process.env.APP_NAME || "Cloud Native Kubernetes Lab",
        hostname: os.hostname(),
        version: process.env.APP_VERSION || "1.0.0",
        environment: process.env.ENVIRONMENT || "development",
        logLevel: process.env.LOG_LEVEL || "info",
        namespace: process.env.NAMESPACE || "local",
        time: new Date().toLocaleString()
    });
});

app.listen(3000, () => {
    console.log(`${process.env.APP_NAME || "Application"} started`);
    console.log(`Version: ${process.env.APP_VERSION || "1.0.0"}`);
    console.log(`Environment: ${process.env.ENVIRONMENT || "development"}`);
    console.log(`Log Level: ${process.env.LOG_LEVEL || "info"}`);
    console.log(`Hostname: ${os.hostname()}`);
});