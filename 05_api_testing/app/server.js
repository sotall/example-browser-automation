const http = require('http');

const server = http.createServer((req, res) => {
  if (req.url === '/api') {
    const response = {
      message: 'Hello from the backend API!'
    };

    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(response));
  } else if (req.url === '/api/another-endpoint') {
    const response = {
      data: {
        endpoint: 'another-endpoint',
        message: 'This is another API endpoint.'
      }
    };

    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(response));
  } else if (req.url === '/api/third-endpoint') {
    if (req.method === 'POST') {
      let body = '';
      req.on('data', chunk => {
        body += chunk;
      });

      req.on('end', () => {
        const requestBody = JSON.parse(body);
        const response = {
          data: {
            endpoint: 'third-endpoint',
            message: 'This is the third API endpoint.',
            username: requestBody.username,
            password: requestBody.password
          }
        };

        res.setHeader('Content-Type', 'application/json');
        res.end(JSON.stringify(response));
      });
    } else {
      res.statusCode = 400;
      res.end('Bad Request');
    }
  } else {
    res.statusCode = 404;
    res.end('Not Found');
  }
});

const port = 3000;
server.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
