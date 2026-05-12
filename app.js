const express = require('express');
const app = express();
const port = 3000;

app.get('/api/demo', (req, res) => {
  res.json({ message: 'Hello from main, development, and feature-conflict-a! (Merged)' });
});

app.get('/api/stash-demo', (req, res) => {
  res.json({ message: 'Stash demo endpoint!' });
});

app.listen(port, () => {
  console.log(`Demo API listening on port ${port}`);
});
