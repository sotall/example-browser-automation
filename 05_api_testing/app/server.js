const http = require('http');
const jwt = require('jsonwebtoken');
const cors = require('cors');
const bodyParser = require('body-parser');

const secretKey = 'your_secret_key';

// Sample user credentials for demonstration purposes
const users = [
  { username: 'admin', password: 'password' },
  { username: 'user', password: '123456' }
];

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
            const { username, password } = requestBody;

            if (!username || !password) {
              res.statusCode = 400;
              res.end('Bad Request: Missing username or password');
              return;
            }

            // Check if the provided username and password match any user credentials
            const user = users.find(u => u.username === username && u.password === password);
            if (!user) {
              res.statusCode = 401;
              res.end('Unauthorized');
              return;
            }

            const token = jwt.sign({ username }, secretKey);
            const response = {
              data: {
                endpoint: 'login',
                message: 'This is the third API endpoint.',
                username,
                token
              }
            };

            res.writeHead(201, { 'Content-Type': 'application/json' });
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
