const http = require('http');

const server = http.createServer((req, res) => {
  if (req.url === '/api') {
    const response = {
      message: 'Hello from the backend API!'
    };

    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(response));
  } else {
    res.statusCode = 404;
    res.end('Not Found');
  }
});

const port = 3005;
server.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
