const express = require('express');
const app = express();
const port = 3000;

app.get('/api/demo', (req, res) => {
  res.json({ message: 'Hello from Feature A and Feature B! Conflict resolved.' });
});

app.listen(port, () => {
  console.log(`Demo API listening on port ${port}`);
});
