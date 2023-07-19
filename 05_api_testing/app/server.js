const http = require('http');
const jwt = require('jsonwebtoken');
const cors = require('cors');

const secretKey = 'your_secret_key';

function verifyToken(req, res, next) {
  const authHeader = req.headers.authorization;
  if (authHeader) {
    const token = authHeader.split(' ')[1]; // Extract the token from the "Bearer <token>" format
    jwt.verify(token, secretKey, (err, user) => {
      if (err) {
        return res.sendStatus(403); // Invalid token
      }
      req.user = user; // Attach the user object to the request for further processing
      next();
    });
  } else {
    res.sendStatus(401); // Unauthorized
  }
}

const server = http.createServer((req, res) => {
  // Enable CORS for all routes
  cors()(req, res, () => {
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
    } else if (req.url === '/api/login') {
      if (req.method === 'POST') {
        let body = '';
        req.on('data', chunk => {
          body += chunk;
        });

        req.on('end', () => {
          try {
            const requestBody = JSON.parse(body);
            const token = jwt.sign({ username: requestBody.username }, secretKey);
            const response = {
              data: {
                endpoint: 'login',
                message: 'This is the third API endpoint.',
                username: requestBody.username,
                password: requestBody.password,
                token: token
              }
            };

            res.setHeader('Content-Type', 'application/json');
            res.end(JSON.stringify(response));
          } catch (error) {
            res.statusCode = 400;
            res.end('Bad Request');
          }
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
});

const port = 3000;
server.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
